<!DOCTYPE html>
<html>
<head>
    <title>Update To-Do Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update To-Do Item</h2>
        <form action="UpdateToDo" method="post">
            <!-- Hidden input field for the to-do item ID -->
            <input type="hidden" id="todoId" name="todoId" value="<%= request.getParameter("id") %>">
            
            <label for="todoDescription">To-Do Description:</label>
            <input type="text" id="todoDescription" name="todoDescription" value="<%= request.getParameter("description") %>" required>
            
            <label for="todoStatus">Status:</label>
            <select id="todoStatus" name="todoStatus">
                <option value="open" <%= "incomplete".equals(request.getParameter("status")) ? "selected" : "" %>>InComplete</option>
                <option value="in-progress" <%= "in-progress".equals(request.getParameter("status")) ? "selected" : "" %>>In Progress</option>
                <option value="completed" <%= "completed".equals(request.getParameter("status")) ? "selected" : "" %>>Completed</option>
            </select>
            
            <label for="todoDueDate">Due Date:</label>
            <input type="date" id="todoDueDate" name="todoDueDate" value="<%= request.getParameter("dueDate") %>"> <br><br><br>

            <button type="submit">Update To-Do</button>
        </form>
    </div>
</body>
</html>
