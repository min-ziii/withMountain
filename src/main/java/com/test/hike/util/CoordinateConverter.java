package com.test.hike.util;

import org.locationtech.proj4j.*;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class CoordinateConverter {

    private static final String SPOT = "HIKINGROADSPOT";
    private static final String COORD = "HIKINGROADCOORD";

    private static final Map<String, String[]> TABLE_COLUMN_MAP = new HashMap<>();

    static {
        TABLE_COLUMN_MAP.put(SPOT, new String[]{"SPOT_ID", "SPOT_X", "SPOT_Y"});
        TABLE_COLUMN_MAP.put(COORD, new String[]{"COORD_ID", "ROAD_X", "ROAD_Y"});
    }

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:oracle:thin:@15.165.120.37:1521:xe"; // JDBC URL
        String username = "hike";
        String password = "java1234";
        String tableName = SPOT; // 중요!!!! 변환할 테이블 이름 (SPOT 또는 COORD)

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버를 찾을 수 없습니다: " + e.getMessage());
            return;
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {

            // TM 중부 좌표계 정의 (WGS84)
            String tmProjection = "+proj=tmerc +lat_0=38.0 +lon_0=127.0 +x_0=200000.0 +y_0=600000.0 +k=1.0 +ellps=GRS80 +units=m +no_defs";
            // EPSG:4326 좌표계 정의
            String epsg4326Projection = "+proj=longlat +datum=WGS84 +no_defs";

            CRSFactory crsFactory = new CRSFactory();
            CoordinateReferenceSystem tmCRS = crsFactory.createFromParameters("TM", tmProjection);
            CoordinateReferenceSystem epsg4326CRS = crsFactory.createFromParameters("EPSG:4326", epsg4326Projection);

            CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();
            CoordinateTransform transform = ctFactory.createTransform(tmCRS, epsg4326CRS);

            String[] columns = TABLE_COLUMN_MAP.get(tableName);
            if (columns == null || columns.length != 3) {
                System.err.println("지원하지 않는 테이블 이름입니다: " + tableName);
                return;
            }
            String idColumn = columns[0];
            String xColumn = columns[1];
            String yColumn = columns[2];

            String selectSQL = String.format("SELECT %s, %s, %s FROM %s WHERE %s IS NOT NULL AND %s IS NOT NULL",
                    idColumn, xColumn, yColumn, tableName, xColumn, yColumn);
            PreparedStatement selectStmt = connection.prepareStatement(selectSQL);
            ResultSet resultSet = selectStmt.executeQuery();

            String updateSQL = String.format("UPDATE %s SET %s = ?, %s = ? WHERE %s = ?",
                    tableName, xColumn, yColumn, idColumn);
            PreparedStatement updateStmt = connection.prepareStatement(updateSQL);

            while (resultSet.next()) {
                int id = resultSet.getInt(idColumn);
                double xValue = resultSet.getDouble(xColumn);
                double yValue = resultSet.getDouble(yColumn);

                // 좌표 변환
                ProjCoordinate tmCoord = new ProjCoordinate(xValue, yValue);
                ProjCoordinate epsg4326Coord = new ProjCoordinate();

                try {
                    transform.transform(tmCoord, epsg4326Coord);

                    updateStmt.setDouble(1, epsg4326Coord.x);
                    updateStmt.setDouble(2, epsg4326Coord.y);
                    updateStmt.setInt(3, id);
                    updateStmt.executeUpdate();
                } catch (Exception e) {
                    System.err.println("좌표 변환 오류: " + e.getMessage());
                }
            }

            resultSet.close();
            selectStmt.close();
            updateStmt.close();

            System.out.println("좌표 변환 및 업데이트 완료!");

        } catch (SQLException e) {
            System.err.println("DB 오류: " + e.getMessage());
        }
    }
}
