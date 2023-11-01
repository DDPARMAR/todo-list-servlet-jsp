import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddTodoServlet")
public class addToDo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Database connection information
        String url = "jdbc:mysql://localhost:3306/todo";
        String user = "root";
        String password = "";

        // Get the form data
        String todoDescription = request.getParameter("todoDescription");
        String todoDate = request.getParameter("todoDate");

        // Database insert query (with auto-incremented ID and default status)
        String insertQuery = "INSERT INTO todo_info (todo_description, todo_date, todo_status) VALUES (?, ?, 'incomplete')";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection connection = DriverManager.getConnection(url, user, password);

            // Create a prepared statement for the insert query
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, todoDescription);
            preparedStatement.setString(2, todoDate);

            // Execute the insert statement
            preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
            connection.close();

            // Send a success response to the client
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Todo added successfully.'); window.location.href='index.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            // Send an error response to the client
            PrintWriter out = response.getWriter();
            out.println("<script>alert('An error occurred.'); window.location.href='index.jsp';</script>");
        }
    }
}
