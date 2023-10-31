<!DOCTYPE html>
<html>
<head>
    <title>Todo Details</title>
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
        input[type="date"] {
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
        <h2>Add Todo</h2>
        <form>
            <label for="todoDescription">Todo Description:</label>
            <input type="text" id="todoDescription" name="todoDescription" required>
            <label for="todoDate">Todo Date:</label>
            <input type="date" id="todoDate" name="todoDate" required>
            <button type="submit">Add Todo</button>
        </form>
    </div>
</body>
</html>
