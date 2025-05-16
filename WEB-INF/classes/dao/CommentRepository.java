package dao;

import java.util.ArrayList;
import dto.Comment;

public class CommentRepository {
	private ArrayList<Comment> listOfComments = new ArrayList<>();
	private static CommentRepository instance = new CommentRepository();

	public static CommentRepository getInstance() {
		return instance;
	}

	public CommentRepository() {
		Comment Comment1 = new Comment("post1", "댓글 내용");
		Comment1.setCommenterId("작성자1");
		
		Comment Comment1_1 = new Comment("post1", "댓글 내용");
		Comment1_1.setCommenterId("작성자2");
		
		Comment Comment2 = new Comment("post1", "댓글 내용");
		Comment2.setCommenterId("작성자3");
		
		listOfComments.add(Comment1);
		listOfComments.add(Comment1_1);
		listOfComments.add(Comment2);
	}
	
	public ArrayList<Comment> getAllComments() {
		return listOfComments;
	}
	
	public Comment getCommentById(String commentId) {
		Comment CommentById = null;
		
		for (int i=0; i<listOfComments.size(); i++) {
			Comment Comment = listOfComments.get(i);
			if (Comment!=null && Comment.getCommentId() != null && Comment.getCommentId().equals(commentId)) {
				CommentById = Comment;
				break;				
			}			
		}
		return CommentById;
	}	
	
	public Comment getCommentByCommentId(String commentId) {
        Comment CommentByCommentId = null;

        for (int i = 0; i < listOfComments.size(); i++) {
            Comment Comment = listOfComments.get(i);
            if (Comment != null && Comment.getCommenterId() != null && Comment.getCommenterId().equals(commentId)) {
            	CommentByCommentId = Comment;
                break;
            }
        }
        return CommentByCommentId;
    }

	public void addComment(Comment Comment) {
		listOfComments.add(Comment);
	}
	
	public Comment replyComment(String commentId) {
		Comment CommentById = null;
		
		for (int i=0; i<listOfComments.size(); i++) {
			Comment Comment = listOfComments.get(i);
			if (Comment!=null && Comment.getCommentId() != null && Comment.getCommentId().equals(commentId)) {
				CommentById = Comment;
				break;				
			}			
		}
		return CommentById;
	}	
	
	public void deleteComment(String commentId) {
        Comment Comment = null;
        Comment.setComments("작성자에 의해 삭제되었습니다.");
	}
}