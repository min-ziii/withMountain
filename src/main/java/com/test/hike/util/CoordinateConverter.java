package com.test.hike.util;

import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.CoordinateTransform;
import org.locationtech.proj4j.ProjCoordinate;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateTransformFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CoordinateConverter {

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:oracle:thin:@15.165.120.37:1521:xe"; // JDBC URL
        String username = "hike";
        String password = "java1234";

        // 드라이버 로드
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

            // CRSFactory를 사용하여 좌표계 객체 생성
            CRSFactory crsFactory = new CRSFactory();
            CoordinateReferenceSystem tmCRS = crsFactory.createFromParameters("TM", tmProjection);
            CoordinateReferenceSystem epsg4326CRS = crsFactory.createFromParameters("EPSG:4326", epsg4326Projection);

            // CoordinateTransformFactory를 사용하여 변환 객체 생성
            CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();
            CoordinateTransform transform = ctFactory.createTransform(tmCRS, epsg4326CRS);

            // 데이터 조회
            String selectSQL = "SELECT COORD_ID, ROAD_X, ROAD_Y FROM HIKINGROADCOORD WHERE ROAD_X IS NOT NULL AND ROAD_Y IS NOT NULL";
            PreparedStatement selectStmt = connection.prepareStatement(selectSQL);
            ResultSet resultSet = selectStmt.executeQuery();

            // 업데이트 쿼리 준비
            String updateSQL = "UPDATE HIKINGROADCOORD SET ROAD_X = ?, ROAD_Y = ? WHERE COORD_ID = ?";
            PreparedStatement updateStmt = connection.prepareStatement(updateSQL);

            // 좌표 변환 및 업데이트
            while (resultSet.next()) {
                int id = resultSet.getInt("COORD_ID");
                double xValue = resultSet.getDouble("ROAD_X");
                double yValue = resultSet.getDouble("ROAD_Y");

                // 좌표 변환
                ProjCoordinate tmCoord = new ProjCoordinate(xValue, yValue);
                ProjCoordinate epsg4326Coord = new ProjCoordinate();

                try {
                    transform.transform(tmCoord, epsg4326Coord);

                    // 업데이트
                    updateStmt.setDouble(1, epsg4326Coord.x);
                    updateStmt.setDouble(2, epsg4326Coord.y);
                    updateStmt.setInt(3, id);
                    updateStmt.executeUpdate();
                } catch (Exception e) {
                    System.err.println("좌표 변환 오류: " + e.getMessage());
                }
            }

            // 리소스 정리
            resultSet.close();
            selectStmt.close();
            updateStmt.close();

            System.out.println("좌표 변환 및 업데이트 완료!");

        } catch (SQLException e) {
            System.err.println("DB 오류: " + e.getMessage());
        }
    }
}
