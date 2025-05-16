package dto;
 
import java.util.Date;
import java.sql.Timestamp;

public class Member {
    private String id;
    private String password;
    private String name;
    private String gender;
    private String birth;
    private String mail;
    private String phone;
    private Timestamp timestamp;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getGender() {
    	return gender;
    }
    public void setGender(String gender) {
    	this.gender = gender;
    }
    public String getBirth() {
    	return birth;
    }
    public void setBirth(String birth) {
    	this.birth = birth;
    }
    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }
    public String getPhone() {
    	return phone;
    }
    public void setPhone(String phone) {
    	this.phone = phone;
    }
    public Timestamp getTimestamp() {
        return timestamp;
    }
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
    
}