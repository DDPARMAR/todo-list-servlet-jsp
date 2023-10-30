<% 
    Cookie ck[] = request.getCookies();
    boolean exists = false;

    if (ck != null) {
        for (Cookie c : ck) {
            if (c.getName().equals("username")) {
                exists = true;
                break;
            }
        }
    }

    if (exists) {
%>
    <script>
        alert("Page Access Denied. You Need To Logout To Access This Page.");
        window.location.href = "index.jsp";
    </script>
<%
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIGN UP</title>
    <link rel="stylesheet" href="CSS/FORM_STYLE.css">
</head>
<body>
    <form action="signup" method="post">
        <div class="form-structor">
            <div class="signup">
                <h2 class="form-title" id="signup">Sign up</h2>
                <div class="form-holder">
                    <input type="text" class="input" placeholder="Name" name="username"/>
                    <input type="email" class="input" placeholder="Email" name="email"/>
                    <input type="password" class="input" placeholder="Password" name="password"/>
                </div>
                <button class="submit-btn">Sign up</button>
            </div>
            
        </div> 
    </form>   
    <script>
        console.clear();

        const loginBtn = document.getElementById('login');
        const signupBtn = document.getElementById('signup');

        loginBtn.addEventListener('click', (e) => {
            let parent = e.target.parentNode.parentNode;
            Array.from(e.target.parentNode.parentNode.classList).find((element) => {
                if(element !== "slide-up") {
                    parent.classList.add('slide-up')
                }else{
                    signupBtn.parentNode.classList.add('slide-up')
                    parent.classList.remove('slide-up')
                }
            });
        });

        signupBtn.addEventListener('click', (e) => {
            let parent = e.target.parentNode;
            Array.from(e.target.parentNode.classList).find((element) => {
                if(element !== "slide-up") {
                    parent.classList.add('slide-up')
                }else{
                    loginBtn.parentNode.parentNode.classList.add('slide-up')
                    parent.classList.remove('slide-up')
                }
            });
        });
    </script>
</body>

</html>
