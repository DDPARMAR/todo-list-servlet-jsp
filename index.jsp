<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            text-align: center;
            border-radius: 10px;
        }
        th, td {
            border: 1px solid #007BFF;
            padding: 10px;
        }
        th {
            background-color: #FF6347; /* Change the table heading color to Tomato */
            color: white;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            display: flex;
            align-items: center;
            margin: 5px 0;
        }
        button {
            background: linear-gradient(to bottom, #FF4500, #FF6347); /* Gradient color */
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 5px; /* Add border radius */
        }

        .add-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin: 10px 0; /* Add margin */
            border-radius: 5px;
        }

        hr {
            border: 1px solid wheat;
            margin: 20px 0; /* Add margin and space above the horizontal line */
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
        }

        .action-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
    <script>
        function showErrorAlert() {
            alert("An error occurred while accessing the database.");
        }
    </script>
</head>
<body>
    <h1>To-Do List</h1>

    <a href="addtodo.jsp"><button class="add-button" type="button">Add Task</button></a>
    <hr /> <!-- Horizontal line -->

    <table>
        <tr>
            <th>ID</th>
            <th>Task Description</th>
            <th>Status</th>
            <th>Due Date</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <!-- Use scriptlet tags to display dynamic to-do items from the database -->
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Load your database driver
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "");
                String query = "SELECT * FROM todo_info";
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int todoId = resultSet.getInt("todo_id");
                    String todoDescription = resultSet.getString("todo_description");
                    String todoStatus = resultSet.getString("todo_status");
                    String todoDueDate = resultSet.getString("todo_date"); // Retrieve the due date
        %>
        <tr>
            <td><%= todoId %></td>
            <td><%= todoDescription %></td>
            <td><%= todoStatus %></td>
            <td><%= todoDueDate %></td>
            <td><a href="updatetodo.jsp?id=<%= todoId %>&description=<%= todoDescription %>&status=<%= todoStatus %>&dueDate=<%= todoDueDate %>"><button class="action-button">Edit</button></a></td>
            <td><a href="deletetodo.jsp?id=<%= todoId %>&description=<%= todoDescription %>"><button class="action-button">Delete</button></a></td>
        </tr>
        <%
                }
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <script>
            showErrorAlert();
        </script>
        <%
            }
        %>
    </table>
</body>
</html>
