<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Comment" %>
<%@ page import="dao.CommentRepository" %>

<!-- Comment list-->
<div id="commentList">
	<%
    	CommentRepository dao = CommentRepository.getInstance();
        ArrayList<Comment> listOfComments=dao.getAllComments();
    
        for (Comment comment : listOfComments) {
    %>	
		
    <!-- 기존 댓글 -->
    <div class="d-flex mb-4">
    <!-- 댓글 작성자 이미지 -->
    	<div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
        	<div class="ms-3">
    <!-- 댓글 작성자 -->
           	<div class="fw-bold"><%=comment.getCommenterId() %></div>
    <!-- 댓글 내용 -->
			<%=comment.getComments() %>
    <!-- 대댓글  -->
              <div class="d-flex mt-4">
               <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
               <div class="ms-3">
	                	<div class="fw-bold">이름</div>
					댓글1-댓글
                      </div>
              </div>
          </div>
     </div>
     <%
   	}		
	%>
</div>