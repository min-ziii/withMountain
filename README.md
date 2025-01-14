
# <산과함께🏔️>
[프로젝트 링크](https://narrow-cacao-5d2.notion.site/177362560a0c8144b119c7a76cc6b566)


## 프로젝트 개요
"산과 함께"는 대한민국의 다양한 산을 소개하고, 각 산의 등산 경로와 코스를 시각적으로 제공하며, 사용자 맞춤형 경로 설정이 가능한 등산 모임 관리 시스템입니다. 사용자는 산의 상세 정보와 등산 코스를 확인하고, 자신만의 등산 경로를 커스터마이징할 수 있습니다. 
또한, 산에 관심 있는 사람들끼리 모임을 만들고 가입하며, 등산 관련 커뮤니티에서 정보를 교환하고 소통할 수 있습니다. 본 시스템은 등산을 더욱 즐겁고 편리하게 할 수 있는 다양한 기능을 제공하여, 등산을 좋아하는 모든 사용자들에게 유용한 플랫폼입니다.

## 주요 기능
- 등산로 커스텀
- 산 및 등산 코스 조회
- 자유로운 모임 및 커뮤니티 활동

## 담당 업무
**[산과함께 커뮤니티 게시판]**

- **커뮤니티 게시판 디자인**
- **사진 게시판 관리**
사용자가 등산 사진을 자유롭게 공유할 수 있도록 사진 게시판을 관리했습니다. 게시판의 게시물 업로드, 검토 및 정리 작업을 수행하여 사용자들이 원활하게 사진을 공유하고 볼 수 있도록 지원했습니다.

- **자유 게시판 관리**
등산과 관련된 자유로운 의견 교환과 소통을 위한 게시판을 관리했습니다. 게시판의 질서를 유지하고, 사용자가 올린 글에 대한 피드백을 제공하며 커뮤니티 활성화를 도왔습니다.

- **질답 게시판 관리**
사용자가 등산 관련 질문을 올리고 답변할 수 있는 게시판을 관리했습니다. 질문과 답변의 정확성을 확인하고, 필요한 경우 답변을 추가하거나 수정하여 유용한 정보가 제공될 수 있도록 했습니다.


## 개발 환경 및 언어
- **언어**: Java (JDK 11)
- **개발 환경**: Windows 11, Spring Framework
- **데이터베이스**: Oracle Database 11c, SQL Developer
- **설계 도구**: ERDCloud, draw.io, Figma
- **기타**: Git


## 기타 사항
- Oracle 서버와 통신할 경우를 생각해 ojdbc6.jar를 import했다.

- HikariCP와 DB 연동용 프레임워크 MyBatis를 추가했다.

- @ResponseBody를 사용해 JSON형으로 Ajax 통신할 경우를 대비해 jackson 라이브러리를 추가했다.

- REST API 작성을 대비해 Swagger 라이브러리를 추가했다.

- 로그 확인을 위해 Log4J 설정들을 추가했다.

목표: Spring, RESTful, MyBatis Mapper를 사용하여 json파일 데이터를 java로 읽은 후 OracleDB에 IMPORT 