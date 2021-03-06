<html>
<head>
    <title>Please enter the details</title>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">



    <script>
    function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

    </script>
    <style>
       html {
    position: relative;
    min-height: 100%;
}

    body{
margin: 0 0 100px;
    /* bottom = footer height */
    padding: 25px;


 background: url("resources/water.jpg") no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  text-align:center;
}

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
  color: #ffffff;
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
    </style>

</head>
<body>

<c:when text="${!alreadyExists.equals(null)}">
    <h3>${alreadyExists}</h3>
</c:when>
<div id="formcontainer">
    <form method="POST" action="FormServlet">

        <input type="text" id="firstname" class="formStyle" name="firstname" placeholder="First Name (required)"
               required><br>
        <input type="text" id="lastname" class="formStyle" name="lastname" placeholder="Last Name (required)"
               required><br>
        <input type="text" id="username" class="formStyle" name="username" placeholder="User Name (required)"
               required><br>
        <div>
            <input type="password" required id="password" class="formStyle" name="password"
                   placeholder="Password (required)" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{10,}$"
                   title="Must contain at least one  number and one uppercase and lowercase letter, and at least 10 or more characters">

            <input id="showbutton" type="button" onclick="myFunction()" value="Show Password" required><br>
        </div>
        <input type="text" id="city" class="formStyle" name="city" placeholder="City"><br>
        <input type="tel" id="phonenr" class="formStyle" name="phonenr" placeholder="Phone Number (required)"
               pattern="0[0-9]{9}"
               title="Must start with 0 , and contain only 10 numbers" required>

        <input id="submitButton" class="formButton" type="SUBMIT">
    </form>
</div>

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


</body>

</html>