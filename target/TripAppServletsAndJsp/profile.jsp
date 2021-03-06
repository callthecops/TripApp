<%@ page import="java.util.List,com.example.model.Trip,java.io.InputStream,java.time.LocalDate" %>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <title>Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Arvo&family=Bevan&display=swap" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link href="resources/bootstrap.min.css" rel="stylesheet">

    <!-- EXTERNAL RESOURCES -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,700">
    <link rel="stylesheet" href="resources/style.min.css">


    <style>
       html {
    position: relative;
    min-height: 100%;
}

  body{
margin: 0 0 100px;
    /* bottom = footer height */
    padding: 25px;


   background-image: linear-gradient(to top,rgba(100, 179, 244, 1),rgba(100, 179, 244, 1), rgba(205, 220, 57, 1));}
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  text-align:center;
}

footer {}


footer {

    position: absolute;
    left: 0;
    bottom: 0;
    height: 80px;
    width: 100%;
    overflow: hidden;
}

   #formcontainer {
  width: 500px;
  margin: auto;

}

.formStyle {
  background-color: rgba(0,0,0,0);
  padding: 20px;
  width: 400px;
  margin-bottom: 20px;
  border-bottom-width: 1px;
  border-bottom-style: solid;
  border-bottom-color: #ecf0f1;
  border-top-style: none;
  border-right-style: none;
  border-left-style: none;
  font-size: 1.5em;
  font-weight: 100;
  color: white;
  border-radius:5px;
}

.formButton {

	background-color:#ffffff;
	display:inline-block;
	color:#2ecc71;
	font-size:14px;
	font-weight: 500;
	padding:6px 24px;
  margin-top: 15px;
  margin-right: 60px;
	text-decoration:none;
	border-radius:5px;
}

.formButton:hover {
	background-color: #27ae60;
  color:#ffffff;
}

.formButton:active {
	position:relative;
	top:3px;
}

#showbutton {position:absolute;
margin:10px;
background-color:#ffffff;
	display:inline-block;
	color:#2ecc71;
	font-size:14px;
	font-weight: 500;
	padding:6px 24px;
  margin-top: 15px;
  margin-right: 60px;
	text-decoration:none;
	border-radius:5px;}

#showbutton:hover{background-color: #27ae60;color:#ffffff;}

#utils{text-align:center;}
#title{text-align:center;}
    </style>



</head>
<body>

<div id="wrapper" class="wrapper">
    <header class="header">
        <div class="container">
            <h1 class="header__title">View/Edit profile</h1>
        </div>
    </header>
    <main>
        <div class="container">
            <section>
                <h1 id="title">Profile for ${user.userName}</h1>
                <div id="github-icons"></div>

            </section>
            <section>

                <div id="utils">
                    <c:if text = "${!alreadyExists.equals(null)}">
                        <h3>${alreadyExists}</h3>
                    </c:if>
                    <c:when text="${!success.equals(null)}">
                        <h3>${success}</h3>
                    </c:when>
                </div>



                <div id="formcontainer">
                    <form method="POST" action="UpdateProfileServlet">

                        <input type="text" id="firstname" class="formStyle" name="firstname" value="${user.firstName}"
                               required><br>
                        <input type="text" id="lastname" class="formStyle" name="lastname" value = "${user.lastName}"
                               required><br>
                        <input type="text" id="username" class="formStyle" name="username" value = "${user.userName}"
                               required><br>
                        <div>
                            <input type="password" required id="password" class="formStyle" name="password"
                                   value = "${user.password}" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{10,}$"
                                   title="Must contain at least one  number and one uppercase and lowercase letter, and at least 10 or more characters">

                            <input id="showbutton" type="button" onclick="myFunction()" value="Show Password" required><br>
                        </div>
                        <input type="text" id="city" class="formStyle" name="city" value = "${user.city}"><br>
                        <input type="tel" id="phonenr" class="formStyle" name="phonenr" value = "${user.phoneNr}"
                               pattern="0[0-9]{9}"
                               title="Must start with 0 , and contain only 10 numbers" required>

                        <input id="submitButton" class="formButton" type="SUBMIT" value = "Save User">
                        <a href = "logedin.jsp">Back</a>
                    </form>
                </div>

            </section>
        </div>
    </main>
</div><!-- /wrapper -->

<button id="mm-menu-toggle" class="mm-menu-toggle">Toggle Menu</button>
<nav id="mm-menu" class="mm-menu">
    <div class="mm-menu__header">
        <h2 class="mm-menu__title">${username}</h2>
    </div>
    <ul class="mm-menu__items">
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="MainMenuServlet">
                <span class="mm-menu__link-text"><img src="resources/home.png" height="15" width="15"> Home</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="ProfileServlet">
                <span class="mm-menu__link-text"><img src="resources/profile.png" height="15" width="15"> Profile</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="addtrip.jsp">
                <span class="mm-menu__link-text"><img src="resources/add.png" height="15" width="15"> Add Trip</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="LogoutServlet">
                <span class="mm-menu__link-text"><img src="resources/logout.png" height="15" width="15"> Log Out</span>
            </a>
        </li>

    </ul>
</nav><!-- /nav -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Tudor Andrei 2020</p>
    </div>
    <!-- /.container -->
</footer>


<!--Scripts for template page -->
<script src="resources/jquery.min.js"></script>
<script src="resources/bootstrap.bundle.min.js"></script>

<script src="resources/materialMenu.min.js"></script>
<script>
  var menu = new Menu;

    function myFunction() {
       var x = document.getElementById("password");
       if (x.type === "password") {
         x.type = "text";
       } else {
         x.type = "password";
       }
     }

</script>


</body>
</html>
