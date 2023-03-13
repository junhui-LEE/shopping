<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>CommentTest</h2>

comment: <input type="text" name="comment"><br>

<button id="sendBtn" type="button">SEND</button>
<button id="modBtn" type="button">수정</button>

<div id="commentList"></div>
<script>

  let bno = 1921;

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
    let tmp = '<ul>';
    comments.forEach(function(comment){
      tmp += '<li data-cno=' + comment.cno
      tmp += ' data-pcno=' + comment.pcno
      tmp += ' data-bno=' + comment.bno + '>'
      tmp += ' commenter=<span class="commenter">' + comment.commenter + '</span>'
      tmp += ' comment=<span class="comment">' + comment.comment + '</span>'
      tmp += ' up_date=' + comment.up_date
      tmp += '<button class="delBtn">삭제</button>'
      tmp += '<button class="modBtn">수정</button>'
      tmp += '</li>'
    })
    return tmp += '</li>';
  }

  $(document).ready(function(){
    showList(bno);

    $("#modBtn").click(function(){
      let cno =  $(this).attr("data-cno");
      let comment = $("input[name=comment]").val();
      if(comment.trim()==''){
        alert("댓글을 입력해주세요.");
        $("input[name=comment]").focus()
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
      let comment = $("input[name=comment]").val();
      if(comment.trim()==''){
        alert("댓글을 입력해주세요.");
        $("input[name=comment]").focus()
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
      let cno = $(this).parent().attr("data-cno");
      let comment = $("span.comment", $(this).parent()).text();
      $("input[name=comment]").val(comment);
      $("#modBtn").attr("data-cno", cno);
    });

    $("#commentList").on("click", ".delBtn",function(){
      let cno = $(this).parent().attr("data-cno");
      let bno = $(this).parent().attr("data-bno");
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
</body>
</html>