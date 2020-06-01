<html>
<head>
    <title>Welcome to our TripApp 1.0</title>
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


    <style>

    html {
    position: relative;
    min-height: 100%;
}



footer {

    position: absolute;
    left: 0;
    bottom: 0;
    height: 80px;
    width: 100%;
    overflow: hidden;
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
}


p{font-family: 'Arvo', serif;}

h1 {
  font-family: 'Bevan', cursive;
  margin-left: auto;
  margin-top: 50px;
  text-align: center;
  font-weight: 100;
  font-size: 2.8em;
  color: #ffffff;
}
        ul {text-align:center;}

        li{display:inline-block;padding:margin-left:5px;margin-right:15px;font-weight:bold;padding-right:20px;}


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
#submitButton {
float:right;
}

/*To remove the outline that appears on clicking the input textbox*/
input:focus {
  outline: none;
}

/* To format the placeholder text color */
::-webkit-input-placeholder {
   color: #ecf0f1;
}

:-moz-placeholder { /* Firefox 18- */
   color: #ecf0f1;
}

::-moz-placeholder {  /* Firefox 19+ */
   color: #ecf0f1;
}

:-ms-input-placeholder {
   color: #ecf0f1;
}

a {margin-left:20px;
    font-weight:100;
}

p {text-align:center;
    font-size: 1.2em;}

#jsp {text-align:center;}


    </style>
</head>
<body>
<h1>Welcome to TripApp 1.0 !!!</h1>
<br>
<p>You can use the TripApp 1.0 to organize and manage your beautifull trips and keep memories forever.</p>
<br>
<p>If you are already a member please log in, else please sign up for a free account today !</p>
<br>

<div id="jsp">

    <c:when text="${tryAgain.equals(null)}">
        <h3>${tryAgain}</h3>
    </c:when>

    <c:when text="${!success.equals(null)}">
        <h3>${success}</h3>
    </c:when>

</div>

<div id="formcontainer">
    <form method="POST" action="LoginServlet">
        <input type="text" name="userName" id="userName" class="formStyle" placeholder="user name" autocomplete="off"/>
        <input type="password" name="password" id="password" class="formStyle" placeholder="password" autocomplete="off"/>
        <br>
        <input id="submitButton" class="formButton" type="SUBMIT" value="Log in">
    </form>
    <a href="newuserform.jsp">Sign up</a>
</div>

<br>
<br>
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