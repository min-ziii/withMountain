	- Oracle 서버와 통신할 경우를 생각해 ojdbc6.jar를 import했다.

- HikariCP와 DB 연동용 프레임워크 MyBatis를 추가했다.

- @ResponseBody를 사용해 JSON형으로 Ajax 통신할 경우를 대비해 jackson 라이브러리를 추가했다.

- REST API 작성을 대비해 Swagger 라이브러리를 추가했다.

- 로그 확인을 위해 Log4J 설정들을 추가했다.

목표: Spring, RESTful, MyBatis Mapper를 사용하여 json파일 데이터를 java로 읽은 후 OracleDB에 IMPORT 