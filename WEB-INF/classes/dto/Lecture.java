package dto;

import java.io.Serializable;

public class Lecture implements Serializable {
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String lectureName;		// 강의 제목
	private String category;		// 분류
	private String description;		// 강의 소개
	private String uploadDate;		// 강의 등록일
	private String filename;		// 파일명
	private int unitPrice; // 가격
	
	private int quantity; // 장바구니에 담은 개수
	
	public Lecture() {
		super();
	}
	
	public Lecture(String lectureName, String category, String description) {
		this.lectureName = lectureName;
		this.category = category;
		this.description = description;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getUnitPrice() {
		return unitPrice;
	}
	
	public void setUnitPrice(int unitPrice) {
		this.unitPrice=unitPrice;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}