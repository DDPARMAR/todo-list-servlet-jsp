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
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        
        .add-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            float:left;
        }
    </style>
</head>
<body>
    <h1>To-Do List</h1>
    
    
       <a href="addtodo.jsp"><button class="add-button" type="button">Add Task</button></a> <br>
    
    
    <ul id="todoList">
        <!-- Demo To-Do items -->
        <li>Default To-Do 1 <button onclick="deleteTodo(this)">Delete</button></li>
        <li>Default To-Do 2 <button onclick="deleteTodo(this)">Delete</button></li>
        <li>Default To-Do 3 <button onclick="deleteTodo(this)">Delete</button></li>
    </ul>

</body>
</html>
