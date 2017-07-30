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
    <title>viewBookings</title>

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
        <script type="text/javascript">
            function goBack() {
                window.history.back();
            }
            function send() {
				var x = document.getElementById('cabid').value;          
            	alert(x);
            }
        </script>
        <%
if(session.getAttribute("uname") == null)
{
    response.sendRedirect("loginCust.jsp");
}
%>
    </script>
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
        <center>
            <div class="row">
                <div class="box">
                    <div class="cols-lg-12">
                        <hr> <h2> Your Bookings </h2> <hr>
    <div class="col-lg-10 col-lg-offset-1">
            
                <table class="table table-striped table-hover">
                 <thead class="thead-inverse">
                    <tr>
                        <th >CABID</th>
                        <th >SOURCE </th>
                        <th >DESTINATION </th>
                        <th >DATE </th>
                        <th >TIME </th>
                        <th >CITY </th>
    </tr>
  </thead>
  <tbody>
                    <%
                                String sql = "select * from booking where uname=?";
                                String uname = (String) session.getAttribute("uname");
                                ResultSet rs = AppDao.FetchAllDrecordsID(sql, uname);
                                while (rs.next()) {
                            %>
                    <tr>
                                <td>
                           
                                 
                                <button id = "cabid" class="btn btn-primary" data-toggle="modal
                                data-target="#modal-1" onclick="return send()"
                                value="<%=rs.getString(3)%>"><%=rs.getString(3)%> </button>
                                
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td><%=rs.getString(7)%></td>
                                <td><%=rs.getString(8)%></td>
                            </tr>
                            <tr>
                            <%
                            sql = "select * from cab where cabid=?";
                            String cabid = rs.getString(3);
                            ResultSet cs = AppDao.FetchAllDrecordsID(sql, cabid);
                            while (cs.next()) {
                            %>
                                <td>Cab details: </td>
                                <td>Cab Name: <%=cs.getString(2)%></td>
                                <td>Cab Number: <%=cs.getString(3)%></td>
                                <td>Cab type: <%=cs.getString(4)%></td>
                                <td>No. of seats: <%=cs.getString(5)%></td>
                                <td>Cab color: <%=cs.getString(6)%></td>
                                
                            </tr>
                            <%
                                }
                                }
                            %>
                    </tbody>
              </table>
                <br /> 
                <a href="index.html" class="btn btn-default btn-lg">BACK</a>
		<div class="modal fade" id="modal-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					 <div class="modal-header">
					 	<button type="button" class="close" data-dismiss="modal">&times;</button>
					 	<h3 class="modal-title">Cab details</h3>
					 </div>
					 <div class="modal-body">
					 <table class="table table-striped table-hover">
					 <tr>
                        <th width="32">ID</th>
                        <th width="117">CAB NAME </th>
                        <th width="109"> NUMBER </th>
                        <th width="130"> TYPE </th>
                        <th width="109">NO. OF SEATS </th>
                        <th width="110">COLOR</th>
   					 </tr>
					 	 <%
					 	sql = "select * from cab where cabid=?";
                         String cabid = "11";
                         rs = AppDao.FetchAllDrecordsID(sql, cabid);
                         while (rs.next()) {
					 	 %> 
					 	 <tr>
					 	 <td><%=rs.getString(1)%></td>
					 	 <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
					 	 </tr>
					 	 <%
                                }
                            %>
                    </tbody>
              </table>
					 </div>

					 <div class="modal-footer">
					 	<a href="" class="btn btn-default" data-dismiss="modal">Close</a>
					 </div>
				</div>
			</div>
		</div>
                
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
