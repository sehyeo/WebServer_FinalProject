package dto;

import java.io.Serializable;

public class Post implements Serializable {
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String postId;			// 글 ID
	private String title;			// 글 제목	//
	private String author;			// 작성자
	private String contents;		// 글 내용	//
	private String category;		// 분류		//
	private long hit;				// 조회수
	private String releaseDate;		// 글 작성일	//
	private long comments;			// 댓글수
	private long quantity;			// 공감수

	private String hashtag;			// 해시태그	//
	private String reference;		// 참고 파일	//
	
	public Post() {
		super();
	}
	
	public Post(String postId, String title) {
		this.postId = postId;
		this.title = title;
		this.hit = 0; 
		this.comments = 0; 
		this.quantity = 0; 
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getHit() {
		return hit;
	}

	public void setHit(long hit) {
		this.hit = hit;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public long getComments() {
		return comments;
	}

	public void setComments(long comments) {
		this.comments = comments;
	}

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public long getTotal() {
		return hit + comments + quantity; 
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}