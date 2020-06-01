<%@ page import="java.util.List,com.example.model.Trip,java.io.InputStream,java.time.LocalDate" %>

<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <title>Edit a trip</title>
    <link href="resources/bootstrap.min.css" rel="stylesheet">
    <!-- EXTERNAL RESOURCES -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,700">
    <link rel="stylesheet" href="resources/style.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


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


footer {
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

#impressions{margin-left:10px;}

#photoone {margin-left:10px;
            margin-top:1px;}
#phototwo {margin-left:10px;
            margin-top:1px;}


#photoonelabel{margin-top:10px;}
#phototwolabel{margin-top:5px;}
#backbutton{margin-top:30px;}

footer {

    position: absolute;
    left: 0;
    bottom: 0;
    height: 80px;
    width: 100%;
    overflow: hidden;
}

#topsection{
    text-align:center;}
    </style>


</head>
<body>


<div id="wrapper" class="wrapper">
    <header class="header">
        <div class="container">
            <h1 class="header__title"></h1>
        </div>
    </header>
    <main>
        <div class="container">
            <section id = "topsection">
                <h1>Edit trip ${username}</h1>
            </section>
            <section>

                <div id="formcontainer">
                    <table>
                        <form method="POST" action="UpdateTripServlet" enctype="multipart/form-data">
                            <tr>
                                <td><label for="tripname">Name</label></td>

                                <td><input type="text" id="tripname" class="formStyle" name="tripname"
                                           placeholder="Trip Name (required)" required></td>

                            </tr>
                            <tr>

                                <td><label for="startdate">Start date</label></td>

                                <td><input type="date" id="startdate" class="formStyle" name="startdate"
                                           placeholder="Start Date (required)" required></td>
                            </tr>
                            <tr>

                                <td><label for="enddate">End date</label></td>

                                <td><input type="date" id="enddate" class="formStyle" name="enddate"
                                           placeholder="End Date (required)" required></td>
                            </tr>
                            <tr>

                                <td><label for="impressions">Impressions</label></td>

                                <td><textarea name="impressions" id="impressions" rows="5"
                                              cols="52">Add your impressions here</textarea></td>
                            </tr>

                            <tr>
                                <td><label for="photoone" id="photoonelabel">Add first photo</label></td>

                                <td><input id="photoone" type="file" name="photoone" required></td>
                            </tr>

                            <tr>
                                <td><label for="phototwo" id="phototwolabel">Add second photo</label></td>
                                <td><input id="phototwo" type="file" name="phototwo" required></td>
                            </tr>
                            <br>
                            <tr>

                                <td><label for="location">Trip Location</label></td>

                                <td><input type="text" id="location" class="formStyle" name="location"
                                           placeholder="Location" required></td>

                            </tr>

                            <tr>
                                <td><input id="submitButton" class="formButton" type="SUBMIT" value="Edit Trip"></td>
                        </form>
                        <td>
                            <form method="GET" action="MainMenuServlet">
                                <input type="SUBMIT" value="Back" class="formButton" id="backbutton">
                            </form>
                        </td>
                        </tr>
                    </table>
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
</script>


</body>
</html>
