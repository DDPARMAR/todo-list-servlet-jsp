import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/updateToDoServlet")
public class UpdateToDo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        int todoId = Integer.parseInt(request.getParameter("todoId"));
        String todoDescription = request.getParameter("todoDescription");
        String todoStatus = request.getParameter("todoStatus");
        String todoDueDate = request.getParameter("todoDueDate");

        // JDBC URL, username, and password of MySQL server
        String jdbcUrl = "jdbc:mysql://localhost:3306/todo";
        String dbUser = "root";
        String dbPassword = "";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL update statement to update the to-do item
            String updateSql = "UPDATE todo_info SET todo_description = ?, todo_status = ?, todo_date = ? WHERE todo_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateSql);

            preparedStatement.setString(1, todoDescription);
            preparedStatement.setString(2, todoStatus);
            preparedStatement.setString(3, todoDueDate);
            preparedStatement.setInt(4, todoId);

            // Execute the update statement
            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated > 0) {
                // Item updated successfully, show an alert and then redirect to the to-do list page
                response.getWriter().write("<script>alert('To-Do Item updated successfully!'); window.location = 'index.jsp';</script>");
            } else {
                // Handle the case where the update failed
                response.getWriter().write("<script>alert('Failed to update To-Do Item!'); window.location = 'index.jsp';</script>");
            }

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
            // Handle any exceptions that may occur during the update process
            response.getWriter().write("<script>alert('An error occurred. Please try again later.'); window.location = 'index.jsp';</script>");
        }
    }
}
