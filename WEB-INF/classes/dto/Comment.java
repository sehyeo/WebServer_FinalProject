package dto;

import java.io.Serializable;

public class Comment implements Serializable {
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String commentId;		// 댓글 ID
	private int index;				// 댓글 목록 인덱스
	private String postId;			// 작성자
	private String commenterId;		// 작성자
	private String comments;		// 내용
	private String releaseDate;		// 댓글 작성일
	private long quantity;			// 공감수
	
	public Comment(String postId, String comments) {
		this.postId = postId;
		this.comments = comments;
		this.quantity = 0;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getCommenterId() {
		return commenterId;
	}

	public void setCommenterId(String commenterId) {
		this.commenterId = commenterId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}