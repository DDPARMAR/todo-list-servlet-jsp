<!DOCTYPE html>
<html>
<head>
    <title>Delete To-Do Item</title>
    <script>
        // Retrieve the to-do description from JSP and display a confirmation dialog
        window.onload = function() {
            var todoDescription = "<%= request.getParameter("description") %>";
            var confirmation = confirm("Do you want to delete this to-do item?\n\nDescription: " + todoDescription);
            
            if (confirmation) {
                // If the user confirms, redirect to the DeleteToDo servlet
                window.location.href = "DeleteToDo?id=<%= request.getParameter("id") %>";
            }
        }
    </script>
</head>
</html>
