import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/comments")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private List<Comment> comments = new ArrayList<>();
    private int idCounter = 1;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(comments));
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        Gson gson = new Gson();
        Comment newComment = gson.fromJson(request.getReader(), Comment.class);
        newComment.setId(idCounter++);
        newComment.setName("You");  // 임시 사용자 이름

        comments.add(newComment);

        PrintWriter out = response.getWriter();
        out.print(gson.toJson(newComment));
        out.flush();
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int commentId = Integer.parseInt(request.getParameter("id"));
        comments.removeIf(comment -> comment.getId() == commentId);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\":true}");
        out.flush();
    }
}
