<%@ page import="java.util.List,com.example.model.Trip,java.io.InputStream,java.time.LocalDate" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Trip Manager</title>

    <link href="resources/bootstrap.min.css" rel="stylesheet">

    <!-- EXTERNAL RESOURCES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,700">
    <link rel="stylesheet" href="resources/style.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


    <style>
/* ONLY DROP DOWN BUTTON */

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 4px 8px;
  z-index: 1;
  text-align:center;
}

.dropdown:hover .dropdown-content {
  display: block;
}

a {text-decoration:none;}


#submitbutton{
  background: none;
  border: none;
  padding: 0 px;
  color: #069;
  text-decoration: none;
  cursor: pointer;
  border: 0 px;
  font-size:0.8em;
}

/* ONLY DROP DOWN BUTTON END */

body {
        background-image: linear-gradient(to top,white,white,white, rgba(205, 220, 57, 1));}

#utilities{
        text-align:center;
        }
#pleaseadd {
        text-align:center;
        }


#cardfooter {
            background-color:#CDDC39;}

#cardfooter2 {
            background-color:#CDDC39;}


    </style>


<body>
<%
if(session.getAttribute("username").equals(null))
response.sendRedirect("welcome.jsp");
%>

<div id="wrapper" class="wrapper">
    <header class="header">
        <div class="container" >
            <h1 class="header__title">Trip Manager</h1>
        </div>
    </header>
    <main>
        <div class="container">
            <section>
                <div id="utilities">
                    <c:if test="${!trip.name.equals(null)}">
                        <h1>${trip.name}</h1>
                    </c:if>

                    <c:if test="${!updateSuccess.equals(null)}">
                        <h3>${updateSuccess}</h3>
                    </c:if>
                </div>
                <br>
                <c:choose>

                    <c:when test="${trips.isEmpty()}">
                        <div id="pleaseadd">
                            <p>Please enter some trips to view them</p>
                            <br>
                        </div>
                    </c:when>

                    <c:otherwise>

                        <section>
                            <!-- Page Content HERE STARTS EVERYTHING BESIDES NAVBAR AND FOOTER-->
                            <div class="container">

                                <!-- Heading Row -->
                                <div class="row align-items-center my-5">
                                    <div class="col-lg-7">
                                        <!--Carousel Here -->
                                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                            <!-- Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#myCarousel" data-slide-to="1"></li>

                                            </ol>

                                            <!-- Wrapper for slides -->

                                            <div class="carousel-inner" role="listbox"
                                                 style=" width:100%; height: 500px !important;">
                                                <div class="item active">
                                                    <img src="PhotosServlet?tripId=${trip.id}&photoIndex=1">
                                                </div>

                                                <div class="item">
                                                    <img src="PhotosServlet?tripId=${trip.id}&photoIndex=2">
                                                </div>

                                            </div>

                                            <!-- Left and right controls -->
                                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                                <span class="glyphicon glyphicon-chevron-left"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                                <span class="glyphicon glyphicon-chevron-right"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                        <!--End carousel -->
                                    </div>

                                    <!-- /.col-lg-8 -->
                                    <div class="col-lg-5">
                                        <h1 class="font-weight-light">
                                            <!--DROPDOWN STARTS HERE -->
                                            <div class="dropdown">
                                                <span>Select Trip</span>
                                                <br>
                                                <div class="dropdown-content">
                                                    <c:forEach items="${trips}" var="trip">

                                                        <form method="POST" action="MainMenuServlet">
                                                            <input id="submitbutton" type="SUBMIT" value="${trip.name}">
                                                            <input type="hidden" id="tripid" name="tripid"
                                                                   value="${trip.id}">
                                                        </form>

                                                    </c:forEach>
                                                </div>
                                                <!--DROPDOWN ENDS HERE -->

                                        </h1>
                                        <!-- SHOWS IMPRESSIONS OF TRIP ONLY IF THEY EXIST -->
                                        <c:if test="${!trip.impressions.equals(null)}">
                                            <p>${trip.impressions}</p>
                                        </c:if>
                                        <br>
                                        <!-- END IMPRESSIONS -->
                                        <!-- UPDATE AND DELETE BUTTONS -->
                                        <form method="POST" action="UpdateDeleteTripServlet">
                                            <input type="submit" class="btn btn-primary" name="update" value="Update">
                                            <input type="hidden" name="butonUpdate" value=${trip.id}>
                                        </form>
                                        <form method="POST" action="UpdateDeleteTripServlet">
                                            <input type="submit" id="formButtonDelete" class="btn btn-primary"
                                                   name="delete" value="Delete">
                                            <input type="hidden" name="butonDelete" value=${trip.id}>
                                        </form>
                                        <!-- UPDATE AND DELETE BUTTONS END -->
                                    </div>
                                    <!-- /.col-md-4 -->
                                </div>
                                <!-- /.row -->
                            </div>

                            <!-- Call to Action Well -->

                            <div class="card text-white bg-secondary my-5 py-4 text-center"
                                 style="background-color:#CDDC39 !important;">
                                <div class="card-body">
                                    <p class="text-white m-0"></p>
                                </div>
                            </div>

                            <!-- Content Row -->
                            <div class="row">
                                <div class="col-md-4 mb-5">


                                    <div class="card h-100">
                                        <!-- TRIP DURATION -->

                                        <div class="card-body">
                                            <h2 class="card-title">Trip Duration</h2>
                                            <c:if test="${!trip.startDate.equals(null)}">
                                                <p class="card-text">
                                                    ${start}${trip.startDate}${end}${trip.endDate}</p>
                                            </c:if>
                                        </div>
                                        <div id="cardfooter" class="card-footer">
                                            <a href="#" class="btn btn-primary btn-sm"
                                               style="background-color:#CDDC39;border:none;color:#CDDC39; !important;">More
                                                Info</a>
                                        </div>
                                        <!-- TRIP DURATION -->
                                    </div>

                                </div>
                                <!-- /.col-md-4 -->
                                <div class="col-md-4 mb-5">
                                    <div class="card h-100">
                                        <!-- TRIP LOCATION END -->
                                        <div class="card-body">
                                            <h2 class="card-title">Trip Location</h2>
                                            <c:if test="${!trip.location.equals(null)}">
                                                <p class="card-text">
                                                    ${trip.location}
                                                </p>
                                            </c:if>
                                        </div>
                                        <div id="cardfooter2" class="card-footer">
                                            <a href="#" class="btn btn-primary btn-sm"
                                               style="background-color:#CDDC39;border:none;color:#CDDC39; !important;">More
                                                Info</a>
                                        </div>
                                        <!-- TRIP LOCATION END -->
                                    </div>
                                </div>
                                <!-- /.col-md-4 -->
                                <!--CAN ADD ANOTHER CARD HERE IF NEEDED -->
                                <!-- /.col-md-4 -->

                            </div>
                            <!-- /.row -->


                        </section>

                    </c:otherwise>
                </c:choose>

            </section>
            <!-- Page Content HERE ENDS EVERYTHING BESIDES NAVBAR AND FOOTER-->
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

<!-- SCRIPT FOR NAVBAR HERE -->
<script src="resources/materialMenu.min.js"></script>
<script>
  var menu = new Menu;




</script>

</body>