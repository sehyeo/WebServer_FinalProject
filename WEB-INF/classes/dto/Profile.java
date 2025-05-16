package dto;

import java.io.Serializable;

public class Profile implements Serializable {
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String profileId;	// 프로필 ID
		private String userId;	// 사용자 ID
	private String role;	// 역할
	private String img;		// 이미지
	
	public Profile() {
		super();
	}
	
	public Profile(String profileId) {
		this.profileId = profileId;
		this.img = "profile.png";
	}

	public String getProfileId() {
		return profileId;
	}

	public void setProfileId(String profileId) {
		this.profileId = profileId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}