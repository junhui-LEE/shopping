# shopping mall 프로젝트 


## :point_right: 프로젝트 소개 

## :point_right: 주요기능

**1. 회원시스템**

* 유효성검사 : 
	* 사용자가 회원가입시 id, pwd를 정해진 규칙으로 보내지 않으면 서버에서 에러메시지 출력 
* 세션, 쿠키 : 
	* 로그인 성공시 세션ID=계정아이디로 쿠키에 담겨 상태정보가 유지된다.
	* 아이디기억 체크박스 클릭시 이전에 입력했던 아이디가 기억된다. 
	* 로그인 실패시 js에서 에러메시지 출력
	* 로그인 되지 않은 상태에서 Board메뉴 클릭시 로그인폼 출력, 이후 게시판 메뉴로 바로 이동한다. 구현방법은 로그인페이지에 속성을 hidden으로 하는 `<input>`태그를 만들고 그곳에 게시판 정보를 주고 url에 toURL 파라미터를 붙여서 컨트롤러에서 처리 
	
* DB접근 : 
	* JDBC 사용 , DAO작성 

**2. 게시판** 

* 페이징 처리 : 
	* 만일 게시물이 많을 경우에 10개씩 그룹화 해서 보여지게끔 구현(페이징 처리)
	* 사실상 보여지는 웹페이지는(boardList.jsp)한개인데 사용자가 페이지를 누름에 따라서 UI와 boardList.jsp 안의 내용이 바뀌어야 함 이를 처리하기 위해서 pageHandler.java 객체를 생성 및 활용하고 jstl 태그 라이브러리를 이용해서 구현했습니다. <br> 쿼리는 `SELECT * FROM board ORDER BY reg_date DESC, bno DESC LIMIT  #{offset}, #{pageSize}`을 사용했습니다.
	
* CRUD(게시판 읽기, 쓰기, 삭제, 수정) : 
	* BoardController.java에 read(), write(), remove(), modify()메서드 구현 
	* 게시판의 작성자를 구분짓기 위해서 HttpSession 인자 활용 
	* 기능 실패시 컨트롤러에서 예외처리 및 게시판 화면(board.jsp)에 경고창 출력 
	* 게시판 쓰기와 게시판 수정을 같은 화면(board.jsp)를 쓰기 때문에 구분짓기 위해서 쓸때에는 "mode"-"new"를 board.jsp에 넘겨준다. 
	* 게시물의 작성자와 계정의 세션ID(로그인 아이디)가 일치할 때 게시물수정, 게시물삭제 가능

* 검색 기능 :
	* boardMapper.xml에 `<choose>`태그와 `LIKE concat('%', #{keyword}, '%')`을 활용해서 <br>검색옵션(제목, 제목+내용, 작성자)에 따라서 다른 SQL문이 적용되도록 구현 
	* 검색 후 들어왔던 페이지로 이동하기 위해서 SearchCondition.java 객체 생성 및 활용 

* DB접근 : MyBatis, DAO, DTO


## :point_right: 프로젝트 주요 관심사 (진행중)

## :point_right: 기술 스택
### 💻 Front-End
<img alt="Html" src ="https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="Css" src ="https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt="JavaScript" src ="https://img.shields.io/badge/JavaScriipt-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=black"/><img alt="jQuery" src ="https://img.shields.io/badge/jQuery-0769AD.svg?&style=for-the-badge&logo=jQuery&logoColor=white"/> <img alt="ajax" src ="https://img.shields.io/badge/ajax-23C8D2.svg?&style=for-the-badge&logo=ajax&logoColor=white"/>

### 💻 Back-End
<img alt="java" src ="https://img.shields.io/badge/java-FBBA00.svg?&style=for-the-badge&logo=java&logoColor=white"/> <img alt="Spring" src ="https://img.shields.io/badge/Spring-6DB33F.svg?&style=for-the-badge&logo=Spring&logoColor=white"/> 
<img alt="Apache Maven" src ="https://img.shields.io/badge/Apache Maven-C71A36.svg?&style=for-the-badge&logo=Apache Maven&logoColor=white"/> <img alt="mybatis" src ="https://img.shields.io/badge/mybatis-6100A5.svg?&style=for-the-badge&logo=mybatis&logoColor=white"/> <img alt="MySQL" src ="https://img.shields.io/badge/MySQL-4479A1.svg?&style=for-the-badge&logo=MySQL&logoColor=white"/> <img alt="Amazon EC2" src ="https://img.shields.io/badge/Amazon EC2-FF9900.svg?&style=for-the-badge&logo=Amazon EC2&logoColor=white"/> <img alt="Apache Tomcat" src ="https://img.shields.io/badge/Apache Tomcat-F8DC75.svg?&style=for-the-badge&logo=Apache Tomcat&logoColor=white"/> 

### 💻 Dev tools
<img alt="Visual Studio Code" src ="https://img.shields.io/badge/Visual Studio Code-007ACC.svg?&style=for-the-badge&logo=Visual Studio Code&logoColor=white"/> <img alt="IntelliJ IDEA" src ="https://img.shields.io/badge/IntelliJ IDEA-000000.svg?&style=for-the-badge&logo=IntelliJ IDEA&logoColor=white"/> <img alt="Git" src ="https://img.shields.io/badge/Git-F05032.svg?&style=for-the-badge&logo=Git&logoColor=white"/> <img alt="GitHub" src ="https://img.shields.io/badge/GitHub-181717.svg?&style=for-the-badge&logo=GitHub&logoColor=white"/> <img alt="Sourcetree" src ="https://img.shields.io/badge/Sourcetree-0052CC.svg?&style=for-the-badge&logo=Sourcetree&logoColor=white"/> <img alt="Postman" src ="https://img.shields.io/badge/Postman-FF6C37.svg?&style=for-the-badge&logo=Postman&logoColor=white"/> 





































ㅁㄴㅇㄹㅁㄴㅇ


### 안녕 

준희

#### 안녕
준희

# 안녕
준희

## 안녕
준희

### 안녕 
준희


---

* * * 


ㅁㄴㅇㄹㄴㅇㄻㄹㄴㅇㄹ
ㅚㅏㅓㅘㅣㅣㅏㅓㅗ






이준희 **GitHub** 입니다. 

이준희 __GitHub__ 입니다. 

이준희 *GitHub* 입니다. 



이준희 ***GitHub*** 입니다. 


취소선을 나타낼 때에는 ~~ㅁㄴㄹㅇㄴㅁㅇㄹ~~ 으~~로 감쌉니다. 


> 인용문이다. 

> 인용문이다. 
>> 인용문 안의 인용문이다. 



소스코드를 넣어볼까나? ` p ublic static void return ` 위에 있는 저 

거는 그래이브키라고 하고 숫자 1 왼쪽에 있다. 

여러줄의 소스코드를 넣어보자 
```java                                                 ㅈㅍㄷㄿㄷㄱㅍㄷㄱㅍㄷㄱㅍㄷㄱ
public static void main(String[] args){                     ㅈㅂㄱㄱㅈㅂㄱㅍㅂㄷㅍㄷㅍㄱ
  int a; 
  int b; 
  return a+b; 
}
```
이렇게 하면 되겠지? 



링크를 넣어보자 세가지 방법이 있는데 첫번째는 <>안에 주소를 넣는것이다. 
<https://www.google.com>

이렇게 나온다. 

그 다음에는 [] 안에 한국말(링크)의 별칭? 을 써 주고 () 안에 주소를 넣는겟이다. 
[구글...일까? 속았지?](https://www.naver.com)

그 다음방법은 위의 방법과 비슷한데 []안에 한국말(링크)의 별칭? 을 써주고 ()안에 주소와 **부가 설명** 을 넣는 것이다. 
[구글..일까? 속았지?](https://www.naver.com, "사실은 네이버")



![이미지 연습](https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMTdfMTcx%2FMDAxNjc2NjIxNzc5NjEw.drrHuEWmaybLyI1UeNAszZcFxhay0iTNYZ_QlsZT4G0g.qk2C6azgQA01vlWUCtKcdjT2qptjldEgX3EK7nQe3Y4g.JPEG.lopec73%2F079A5374.jpg&type=a340)



![이미지를 이렇게 관리하면 편하다](./images/내사진.jpg)
![이미지 디렉터리를 만들고 그것을 원격저장소에서 addFile해서 디렉터리를 올리고 경로는 위에 쓴 것처럼 하면 편하다. 만일 이미지를 계속 추가할 예정이면 지역저장소에 images
디렉터러를 넣어서 관리하는 것이 편하다.](./images/스크린샷(56).png)
















