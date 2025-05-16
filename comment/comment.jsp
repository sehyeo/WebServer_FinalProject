<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Comment" %>
<%@ page import="dao.CommentRepository" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    function addComment(event) {
        event.preventDefault();
        const commentText = document.getElementById('commentText').value.trim();
        if (commentText === '') return;
        
        const commentList = document.getElementById('commentList');
        const newComment = document.createElement('div');
        newComment.classList.add('d-flex', 'mb-4');
        
        const commentHTML = `
            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
            <div class="ms-3">
                <div class="fw-bold">You</div>
                <div>${commentText}</div>
                <button class="btn btn-sm btn-danger ms-2" onclick="deleteComment(this)">삭제</button>
            </div>
        `;
        newComment.innerHTML = commentHTML;
        commentList.appendChild(newComment);
        document.getElementById('commentText').value = '';
    }

    // 내용 수정 기능 수정
    function updateComment(button) {
        const comment = button.parentElement.parentElement;
        comment.remove();
    }
    
    // 수정 중 삭제 가능하게 수정
    function deleteComment(button) {
        const comment = button.parentElement.parentElement;
        comment.remove();
    }
</script>

<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message">
    
<section>
    <div class="card bg-light">
        <div class="card-body">
            <!-- Comment form-->
            <form class="mb-4" action="commentServlet" method="post" onsubmit="addComment(event)">
                <textarea id="commentText" class="form-control" rows="3" placeholder="댓글을 남겨주세요."></textarea>
                <button type="submit" class="btn btn-primary mt-2"><fmt:message key="btn_insert" /></button>
            </form>
            <!-- Comment list-->
		<jsp:include page="comments.jsp" />
            
        </div>
    </div>
</section>
</fmt:bundle>
