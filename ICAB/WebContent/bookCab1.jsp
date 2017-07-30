<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <style>
    .grey{
            background-color: #ffff66;
            padding: 20px;

    }
    .right-panel {
        height: 400px;
        width: 400px;
        overflow: scroll;
      }
    </style>
    
    <!-- animsition.css -->
<link rel="stylesheet" href="animsition-master/dist/css/animsition.min.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- animsition.js -->
<script src="animsition-master/dist/js/animsition.min.js"></script>
<link rel="stylesheet" href="animations.css">
    
    
    </head>

    <body>
    <%
if(session.getAttribute("uname") == null)
{
    response.sendRedirect("loginCust.jsp");
}
%>
<script type="text/javascript"
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4sO7Nqxt93eRI77uxqexRwB3UJsj1C2Q&libraries=places"></script>
                    <script type="text/javascript">
                        var source, destination;
                        var directionsDisplay;
                        var directionsService = new google.maps.DirectionsService();
                        google.maps.event
                                .addDomListener(
                                        window,
                                        'load',
                                        function() {
                                            new google.maps.places.SearchBox(
                                                    document
                                                            .getElementById('txtSource'));
                                            new google.maps.places.SearchBox(
                                                    document
                                                            .getElementById('txtDestination'));
                                            directionsDisplay = new google.maps.DirectionsRenderer(
                                                    {
                                                        'draggable' : true
                                                    });
                                        });

                        function GetRoute() {
                            var mumbai = new google.maps.LatLng(18.9750,
                                    72.8258);
                            var mapOptions = {
                                zoom : 7,
                                center : mumbai
                            };
                            map = new google.maps.Map(document
                                    .getElementById('dvMap'), mapOptions);
                            directionsDisplay.setMap(map);
                            directionsDisplay.setPanel(document
                                    .getElementById('dvPanel'));

                            //*********DIRECTIONS AND ROUTE**********************//

                            source = document.getElementById("txtSource").value;
                            destination = document
                                    .getElementById("txtDestination").value;

                            var request = {
                                origin : source,
                                destination : destination,
                                travelMode : google.maps.TravelMode.DRIVING
                            };
                            directionsService.route(request, function(response,
                                    status) {
                                if (status == google.maps.DirectionsStatus.OK) {
                                    directionsDisplay.setDirections(response);
                                }
                            });

                            //*********DISTANCE AND DURATION**********************//
                            var service = new google.maps.DistanceMatrimdervice();
                            service
                                    .getDistanceMatrix(
                                            {
                                                origins : [ source ],
                                                destinations : [ destination ],
                                                travelMode : google.maps.TravelMode.DRIVING,
                                                unitSystem : google.maps.UnitSystem.METRIC,
                                                avoidHighways : false,
                                                avoidTolls : false
                                            },
                                            function(response, status) {
                                                if (status == google.maps.DistanceMatrimdtatus.OK
                                                        && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                                                    var distance = response.rows[0].elements[0].distance.text;
                                                    var duration = response.rows[0].elements[0].duration.text;
                                                    var dvDistance = document
                                                            .getElementById("dvDistance");
                                                    dvDistance.innerHTML = "";
                                                    dvDistance.innerHTML += "Distance: "
                                                            + distance
                                                            + "<br />";
                                                    dvDistance.innerHTML += "Duration:"
                                                            + duration;

                                                } else {
                                                    alert("Unable to find the distance via road.");
                                                }
                                            });
                        }
                    </script>
    <div class="brand">iCab</div>
        <div class="address-bar">Cabs for Sure</div>

        <!-- Navigation -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">iCab</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html" class="transition" data-transition="horizontal">Home</a>
                    </li>
                    <li class="active">
                        <a href="bookCab1.jsp">Book Cab</a>
                    </li>
                    <li >
                        <a href="loginCust.jsp">Login</a>
                    </li>                    
                    <li>
                        <a href="RegisterCust.jsp" class="transition" data-transition="horizontal">Register</a>
                    </li>
                    <li>
                        <a href="AdminLogin.jsp">Admin Login</a>
                    </li>
                   <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">More
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="editUser.jsp" style="font-size:16px;">Edit profile</a><br /></li>
          <li><a href="viewBookings.jsp" style="font-size:16px;">View Bookings</a><br /></li>
          <li><a href="logoutCust.jsp" style="font-size:16px;">Logout</a></li>
        </ul>
      </li>
                </ul>
            </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-md-12">
                        <div class="container">
                        <div class="well bg-warning col-md-11">   
                        <center> <h2> Book a ride with us </h2> </center>
                        </div>
                        </div>
                        <div class="container">
                            <form action="bookCab2.jsp" method="post"">
                                <div class="form-group col-md-5">
                                    <label for="element-1" class="control-label">Source: </label>
                                    <input required type="text" id="txtSource" name="txtSource" class="form-control" 
                                    value="<%=session.getAttribute("txtSource") == null ? "" : session.getAttribute("txtSource")%>" />
                                </div>
                                <div class="form-group col-md-offset-1 col-md-5" >
                                    <label for="element-2" class="control-label">Destination: </label>
                                    <input required type="text" id="txtDestination" name="txtDestination" class="form-control" 
                                    value="<%=session.getAttribute("txtDestination") == null ? "" : session.getAttribute("txtDestination")%>" />
                                </div>
                                <div class="form-group col-md-offset-5 col-md-6">
                                <input type="button" class="btn btn-default btn-md" value="Get Route" onclick="GetRoute()" />
                                </div>

                                <div class="form-group col-md-5">
                                    <label for="element-1" class="control-label">Date of journey: </label>
                                    <input required type="date" name="date" class="form-control" 
                                    value="<%=session.getAttribute("date") == null ? "" : session.getAttribute("date")%>" />
                                </div>
                                <div class="form-group col-md-offset-1 col-md-5" >
                                    <label for="element-2" class="control-label">Time of journey: </label>
                                    <input required type="time" name="time" class="form-control" placeholder=""
                                    value="<%=session.getAttribute("time") == null ? "" : session.getAttribute("time")%>" />
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="element-1" class="control-label">Seating Capacity: </label>
                                    <select class="form-control" name="nseats">
                                        <option value="4">4</option>
                                        <option value="6">6</option>
                                        <option value="8">8</option>
                                        <option value="10">10</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-offset-1 col-md-5" >
                                    <label for="element-2" class="control-label">City: </label>
                                    <select class="form-control" name="city">
                                        <option value="Delhi">Delhi</option>
                                        <option value="Bengaluru">Bengaluru</option>
                                        <option value="Mumbai">Mumbai</option>
                                        <option value="Kolkata">Kolkata</option>
                                    </select>
                                </div>
                              <div class="col-sm-offset-5 form-group col-md-11">
                                <button type="submit" class="btn btn-primary btn-lg">Continue</button>
                            </div>
                        </form>
                    </div>
                </div>
                <br />
                <center>
                <div id="dvDistance"></div>
                                <br />
                                    <div id="dvMap" style="width: 400px; height: 400px"></div>
                                    <br />
                                    <div class="right-panel" id="dvPanel"></div>                
                        <br />
                </div>
                </center>
            </div>
             
        </div>
        
    </div>
    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; iCab_SB 2016</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="page-transitions.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
