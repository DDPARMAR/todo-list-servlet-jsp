import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteToDo")
public class DeleteToDo extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve the to-do item's ID from the request
        int todoId = Integer.parseInt(request.getParameter("id"));

        // JDBC URL, username, and password of your MySQL server
        String jdbcUrl = "jdbc:mysql://localhost:3306/todo";
        String dbUser = "root";
        String dbPassword = "";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL delete statement to delete the to-do item by ID
            String deleteSql = "DELETE FROM todo_info WHERE todo_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteSql);

            preparedStatement.setInt(1, todoId);

            // Execute the delete statement
            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                // Item deleted successfully, redirect to the to-do list page
                response.sendRedirect("index.jsp");
            } else {
                // Handle the case where the delete failed
                response.getWriter().write("Failed to delete To-Do Item.");
            }

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions that may occur during the delete process
            response.getWriter().write("An error occurred. Please try again later.");
        }
    }
}
