<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ibm.dao.*"%>
<%@ page import="com.ibm.model.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel = "stylesheet" href = "http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <title>Booking Details</title>

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
                <a class="navbar-brand" href="index.html">Business Casual</a>
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
<%
        String cabid = request.getParameter("cabid");
        
        session.setAttribute("cabid", cabid);
        String uname = (String) session.getAttribute("uname");
        String txtSource = (String) session.getAttribute("txtSource");
        String txtDestination = (String) session.getAttribute("txtDestination");
        String date = (String) session.getAttribute("date");
        String time = (String) session.getAttribute("time");
        String city = (String) session.getAttribute("city");
    %>
    <div class="container">
        <center>
            <div class="row">
                <div class="box">
                    <div class="cols-lg-12">
                        <hr> <h2> Journey Details </h2> <hr>
    <div class="col-lg-8 col-lg-offset-2">
            <br />
                <table class="table table-striped table-hover" width="635" height="68">
                <tr>
                    <td class="col-lg-3">Customer name:</td>
                    <td class="col-lg-5"><%=uname%></td>
                </tr>
                <tr>
                    <td>Start Location:</td>
                    <td><%=txtSource%></td>
                </tr>
                <tr>
                    <td>End Location:</td>
                    <td><%=txtDestination%></td>
                </tr>
                <tr>
                    <td>Date of journey:</td>
                    <td><%=date%></td>
                </tr>
                <tr>
                    <td>Time of journey:</td>
                    <td><%=time%></td>
                </tr>
                <td>City:</td>
                <td><%=city%></td>
                </tr>
                </table>
                <hr> <h2> Cab Details </h2> <hr>
                 <br />
                <%
        ResultSet rs1 = null;
        if (request.getParameter("cabid") != null) {
            String cid = request.getParameter("cabid");
            String sql1 = "select * from cab where cabid=?";
            rs1 = AppDao.fetchAllRecordsID(sql1, cid);

            while (rs1.next()) {
    %>
    <table class="table table-striped table-hover" width="635" height="68">
        <tr>
            <td class="col-lg-3">Cab Name</td>
            <td class="col-lg-5"><%=rs1.getString(2)%></td>
        </tr>
        <tr>
            <td>Cab Number</td>
            <td><%=rs1.getString(3)%></td>
        </tr>
        <tr>
            <td>Cab Type</td>
            <td><%=rs1.getString(4)%></td>
        </tr>
        <tr>
            <td>No. of seats</td>
            <td><%=rs1.getString(5)%></td>
        </tr>
        <tr>
            <td>Cab Color</td>
            <td><%=rs1.getString(6)%></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><%=rs1.getString(7)%></td>
        </tr>
    </table>
                 
                
            </form>
            <%
        }
        }
        String xx=request.getParameter("nseats");
        out.println("<br /><br /><a class='btn btn-lg btn-primary' href='confirmBooking.jsp'>CONFIRM BOOKING</a>");
        out.println("<a class='btn btn-md btn-danger' href='index.html'>Cancel Booking</a><br />");
        out.println("<br /><br /><a class='btn btn-md btn-default' href='bookCab1.jsp'>Change Journey Details</a>");
        out.println("<a class='btn btn-md btn-default' href=bookCab2.jsp?nseats="+xx+">Change Cab</a>");
        
        
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

</body>

</html>
