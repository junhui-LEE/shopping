<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>


<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'logOut'}"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>shopping</title>
<%--    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<%--    --%>
    <style>

        .menu-a { text-decoration: none;  }

        .menu-ul {
            list-style-type: none;
            height: 48px;
            width: 100%;
            background-color: #cf2345;
            display: flex;
        }

        .menu-li {
            color: lightgray;
            height : 100%;
            width:90px;
            display:flex;
            align-items: center;
        }

        .menu-a {
            color: lightgray;
            margin:auto;
            padding: 10px;
            font-size:20px;
            align-items: center;
        }

        .menu-ul > .menu-li > .menu-a:hover {
            color :white;
            border-bottom: 3px solid rgb(209, 209, 209);
        }

        #logo {
            color:white;
            font-size: 18px;
            padding-left:40px;
            margin-right:auto;
            display: flex;
        }
    </style>
<%--    --%>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }
        .btn:hover {
            text-decoration: underline;
        }
    </style>
<%--    댓글 <style>  시작 --%>
    <style>
        #comment-ul {
            border:  1px solid rgb(235,236,239);
            border-bottom : 0;
        }

        .comment-li {
            background-color: #f9f9fa;
            list-style-type: none;
            border-bottom : 1px solid rgb(235,236,239);
            padding : 18px 18px 0 18px;
            position: relative;
        }

        #commentList {
            width : 50%;
            height : auto;
            margin : auto;
        }
        .comment-img{
            font-size: 36px;
            position: absolute;
        }
        .comment-area{
            padding: 0 0 0 46px;
        }
        .commenter{
            font-size:12pt;
            font-weight: bold;
        }
        .comment-content{
            overflow-wrap: break-word;
        }
        .comment-bottom{
            font-size: 9pt;
            color: rgb(97,97,97);
            padding: 8px 0 8px 0;
        }
        .comment-bottom > a{
            color: rgb(97,97,97);
            text-decoration: none;
            margin: 0 6px 0 0;
        }
        .up_date{
            margin: 0 8px 0 0;
        }

        #comment-write{
            width : 50%;
            height : 500px;
            margin : auto;
        }

        #button-none {
            border:none;
        }


    </style>
    <%--    댓글 <style>  끝 --%>

</head>
<body>
<div id="menu">
    <ul class="menu-ul">
        <li class="menu-li" id="logo">shopping</li>
        <li class="menu-li" ><a class="menu-a" href="<c:url value='/'/>">Home</a></li>
        <li class="menu-li" ><a class="menu-a" href="<c:url value='/board/list'/>">Board</a></li>
        <li class="menu-li" ><a class="menu-a" href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li class="menu-li" ><a class="menu-a" href="<c:url value='/register/add'/>">Sign in</a></li>
        <li class="menu-li" ><a class="menu-a" href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
    <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="bno" value="${boardDto.bno}">

        <input name="title" type="text" value="<c:out value='${boardDto.title}'/>" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
        <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${boardDto.content}"/></textarea><br>

        <c:if test="${mode eq 'new'}">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
        </c:if>
        <c:if test="${mode ne 'new'}">
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
        </c:if>
        <c:if test="${boardDto.writer eq loginId}">
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
            <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
        </c:if>
        <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
    </form>
</div>
<%--댓글 ui 시작--%>
<br><br><div id="commentList">
</div>

<br><br><div id="comment-write">
    <div class="commenter commenter-writebox">${id}</div>
    <div class="reply-writebox-content">
        <textarea cols="30" rows="3" id="comment-textarea" name="comment" placeholder="댓글을 입력해주세요"></textarea><br>
    </div>
    <div id="reply-writebox-bottom">
        <div class="register-box">
            <button class="btn" id="sendBtn">등록</button>
            <button class="btn" id="modBtn">수정</button>
        </div>
    </div>
</div>


<div id="replyForm" style="display:none">
<%--    <input type="text" name="replyComment">--%>
    <textarea cols="30" rows="3" id="reply-textarea" name="replyComment" placeholder="답글을 입력해주세요"></textarea>
    <button id="wrtRepBtn" type="button">등록</button>
    <button id="wrtCanBtn" type="button">취소</button>
</div>


<%--<button id="sendBtn" type="button">SEND</button>--%>
<%--<button id="modBtn" type="button">수정</button>--%>




<%-- 댓글 UI끝 --%>
<%-- 댓글 <script> 시작 --%>
<script>

    let bno = ${boardDto.bno};

    let showList = function(bno){
        $.ajax({
            type:'GET',
            url: '/shopping/comments?bno='+bno,
            success : function(result){
                $("#commentList").html(toHtml(result));
            },
            error   : function(){ alert("error") }
        });
    }



    let toHtml = function(comments){

        let tmp = '<ul id="comment-ul">';
        comments.forEach(function(comment){

            tmp += '<li class="comment-li" data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'

            if(comment.cno != comment.pcno) {
                tmp += 'ㄴ'
                tmp += '<span class="">'
                tmp += '<i class="" aria-hidden="true"> 답글</i>'
                tmp += '</span>'
            }else {
                tmp += '<span class="comment-img">'
                tmp += '<i class="fa fa-user-circle" aria-hidden="true"></i>'
                tmp += '</span>'
            }

            tmp += '<div class="comment-area">'
            tmp += '<div class="commenter">' + comment.commenter + '</div>'
            tmp += '<div class="comment-content">' + comment.comment + '</div>'
            tmp += '<div class="comment-bottom">'
            tmp += '<span class="up_date">' + comment.up_date + '</span>'
            tmp += '<button id="button-none" class="replyBtn">답글쓰기 </button> '
            tmp += '<button id="button-none" class="modBtn"> 수정 </button> '
            tmp += '<button id="button-none" class="delBtn"> 삭제</button> '
            tmp += '</div></div>'
            // tmp += '<button class="delBtn">삭제</button>'
            // tmp += '<button class="modBtn">수정</button>'
            // tmp += '<button class="replyBtn">답글</button>'
            tmp += '</li>'
        })
        return tmp += '</ul>';
    }

    $(document).ready(function(){
        showList(bno);

        $("#modBtn").click(function(){
            let cno =  $(this).attr("data-cno");
            let comment = $("textarea[name=comment]").val();
            if(comment.trim()==''){
                alert("댓글을 입력해주세요.");
                $("textarea[name=comment]").focus()
                return;
            }
            $.ajax({
                type:'PATCH',
                url: '/shopping/comments/'+cno,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({cno:cno, comment:comment}),
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") }
            });
        });





        $("#sendBtn").click(function(){
            let comment = $("textarea[name=comment]").val();
            if(comment.trim()==''){
                alert("댓글을 입력해주세요.");
                $("textarea[name=comment]").focus()
                return;
            }
            $.ajax({
                type:'POST',
                url: '/shopping/comments?bno='+bno,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({bno:bno, comment:comment}),
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") }
            });
        });


        $("#commentList").on("click", ".modBtn",function(){
            let cno = $(this).parent().parent().parent().attr("data-cno");
            let comment = $("div.comment-content", $(this).parent().parent()).text();
            $("textarea[name=comment]").val(comment);
            $("#modBtn").attr("data-cno", cno);
        });



        $("#commentList").on("click", ".replyBtn",function(){
            // 1. replyForm 을 옮긴다.
            $("#replyForm").appendTo($(this).parent());
            // 2. 답글을 입력하는 폼을 보여준다.
            $("#replyForm").css("display", "block");
        });
        $("#wrtCanBtn").click(function(){
            //1 . 안보이게 하고
            $("#replyForm").css("display", "none");
            //2. 옮겨 놓는다.
            $("#replyForm").appendTo("body");
            $("textarea[name=replyComment]").val('');



        });
        $("#wrtRepBtn").click(function(){
            let comment = $("textarea[name=replyComment]").val();
            let pcno = $("#replyForm").parent().parent().parent().attr("data-pcno");
            if(comment.trim()==''){
                alert("답글을 입력해주세요.");
                $("input[name=replyComment]").focus()
                return;
            }
            $.ajax({
                type:'POST',
                url: '/shopping/comments?bno='+bno,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") }
            });
            $("#replyForm").css("display", "none");
            $("textarea[name=replyComment]").val('');
            $("#replyForm").appendTo("body");
        });

        $("#commentList").on("click", ".delBtn",function(){
            let cno = $(this).parent().parent().parent().attr("data-cno");
            let bno = $(this).parent().parent().parent().attr("data-bno");
            $.ajax({
                type:'DELETE',
                url: '/shopping/comments/'+cno+'?bno='+bno,
                success : function(result){
                    alert(result)
                    showList(bno);
                },
                error   : function(){ alert("error") }
            });
        });

    });

</script>
<%-- 댓글 </script> 끝 --%>
<script>
    $(document).ready(function(){
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }
            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }
        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });
        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });
        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');
            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }
            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });
        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });
        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
        });
    });
</script>
</body>
</html>