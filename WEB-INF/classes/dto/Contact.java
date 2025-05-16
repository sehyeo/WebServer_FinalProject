package dto;

// Contact.java
public class Contact {
    private String name;
    private String email;
    private String phone;
    private String title;
    private String message;

    public Contact(String name, String email, String phone, String title, String message) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.title = title;
        this.message = message;
    }

    // Getters
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getTitle() { return title; }
    public String getMessage() { return message; }
}
