<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
    <style>
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
            margin-left: 10px;
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>To-Do List</h1>
    
    <form action="AddTodoServlet" method="post">
        <input type="text" name="newTodo" placeholder="Add a new to-do">
        <button type="submit">Add</button>
    </form>
    
    <ul>
        <!-- Default to-do items -->
        <li>Default To-Do 1 <button onclick="deleteTodo(0)">Delete</button></li>
        <li>Default To-Do 2 <button onclick="deleteTodo(1)">Delete</button></li>
        <li>Default To-Do 3 <button onclick="deleteTodo(2)">Delete</button></li>
        
        <!-- To-do items will be added here dynamically -->
        <!-- Include your dynamic to-do items here -->
    </ul>
</body>
</html>
