<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ibm.dao.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel = "stylesheet" href = "http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <title>About - iCab - Start Bootstrap Theme</title>

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

        <script type="text/javascript" src="jquery-2.2.4.min.js"></script>
    </head>
    <body>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <script type="text/javascript">
function done()
{
	 var message = document.getElementById('confirmMessage');
	 var goodColor = "#66cc66";
	 alert("Profile updated.");
}
 </script> 
<%
if(session.getAttribute("uname") == null)
{
    response.sendRedirect("loginCust.jsp");
}
%>
    <div class="brand">iCab</div>
    <div class="address-bar">cabs for sure</div>

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
                    <li >
                        <a href="bookCab1.jsp">Book Cab</a>
                    </li>
                    <li >
                        <a href="loginCust.jsp">Login</a>
                    </li>                    
                    <li>
                        <a href="RegisterCust.jsp">Register</a>
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
        <center>
            <div class="row">
                <div class="box">
                    <div class="cols-lg-12">
                        <hr> <h2>Edit User Profile</h2> <hr>
            <%
                    ResultSet ds1 =  null;
                    String sql1 = "select * from registercust where uname=?";
                    ds1 = AppDao.fetchAllRecordsID(sql1, (String)session.getAttribute("uname"));
    
                    while (ds1.next()) {
            %>
            <div class="col-lg-10 col-lg-offset-1">
                <form action="UpdateUserServlet" method="post" class="col-xs-12" onsubmit="return done()">
            <div class="form-group row">
            <input type="hidden" name="uid"  value="<%=ds1.getString(1)%>"/>
            </div>
            <div class="form-group row ">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Full Name </label>
                    <div class="col-sm-4 ">
                        <input required type="text" name="fullname" class="form-control" value="<%=ds1.getString(7)%>">
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> User Name </label>
                    <div class="col-sm-4">
                        <input required type="text" name="uname" class="form-control" value="<%=ds1.getString(2)%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Password </label>
                    <div class="col-sm-4">
                        <input type="text" name="pwd" class="form-control" value="<%=ds1.getString(3)%>">
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Email </label>
                    <div class="col-sm-4">
                        <input required type="email" name="email" class="form-control" value="<%=ds1.getString(4)%>">
                        
                    </div>
                </div>
                <div class="form-group row ">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Mobile Number </label>
                    <div class="col-sm-4 ">
                        <input required type="text" name="mobno" class="form-control" value="<%=ds1.getString(8)%>">
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Date of Birth </label>
                    <div class="col-sm-4">
                        <input required type="date" name="dob" class="form-control" value="<%=ds1.getString(5)%>">
                        
                    </div>
                </div>
                
                
                <div class="form-group row ">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> City </label>
                    <div class="col-sm-4 ">
                        <input required type="text" name="city" class="form-control" value="<%=ds1.getString(6)%>">
                        
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-offset-5 col-sm-2">
                    <br />
                      <button type="submit" class="btn btn-lg btn-primary">Edit Profile</button>
                  </div>
              </div>

              <br /> <br />
          </form>
        <%
                }

            %>  
    </div>


</div>


</div>

<div class="clearfix"></div>
</div>
</div>
</center>
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

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript"> window.onload = alertName; </script>
</body>

</html>
