// ContactServlet.java
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private List<Contact> contactList = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String title = request.getParameter("title");
        String message = request.getParameter("message");

        Contact contact = new Contact(name, email, phone, title, message);
        synchronized (contactList) {
            contactList.add(contact);
        }

        request.setAttribute("contact", contact);
        request.getRequestDispatcher("processContact.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        synchronized (contactList) {
            request.setAttribute("contactList", contactList);
        }
        request.getRequestDispatcher("contactList.jsp").forward(request, response);
    }
}
