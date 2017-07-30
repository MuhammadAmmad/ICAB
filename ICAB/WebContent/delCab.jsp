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
    <title>About - Business Casual - Start Bootstrap Theme</title>

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
        if(session.getAttribute("admin") == null)
        {
        response.sendRedirect("AdminLogin.jsp");
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
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li ><a href="AdminPanel.jsp">Admin Home</a></li>
                    <li class="active"><a href="AdminCabPanel.jsp">Cabs</a></li>
                    <li><a href="AdminDriverPanel.jsp">Drivers</a></li>
                    <li class="last"><a href="logoutAdmin.jsp">Logout</a></li>
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
                        <hr> <h2>DELETE CAB by ID</h2> <hr>
                        <form method="post" action="DeleteCabServlet" class="form-inline">
                          <br />
                            <div class="form-group">
                              <select name="id" class="form-control">
                             <%
                                out.println("<option selected='selected' value='Select cabid'>Select cabid</option>");
                                String sql = "select cabid from cab";
                                ResultSet rs = AppDao.fetchAllRecords(sql);
                                while(rs.next())
                                {
                                out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                                } 
                            %>
                            </select>
                            <small class="text-muted">The selected record will be permanently deleted.</small>
                            </div>  
                            <br />   <br />     
                    <div class="form-group">
                        <button type="submit" class="btn btn-lg btn-danger">Delete Cab</button> 
                    </div>
                    
                </form>
                </div>
            <br /> 
            <br />
            <hr> <h2> OR CHOOSE THE RECORD TO DELETE </h2> <hr>
    <br /> 
    <div class="col-lg-10 col-lg-offset-1">
            <form method="post" action="DeleteCabServlet">
                <table class="table table-striped table-hover" width="635" height="68">
                 <thead class="thead-inverse">
                    <tr>
                        <th width="32">ID</th>
                        <th width="117">CAB NAME </th>
                        <th width="109"> NUMBER </th>
                        <th width="130"> TYPE </th>
                        <th width="109">NO. OF SEATS </th>
                        <th width="110">COLOR</th>
    				</tr>
  				</thead>
  				<tbody>
                    <%
                        sql = "select * from cab";
                        rs = AppDao.fetchAllRecords(sql);
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><input type="radio" value="<%=rs.getString(1)%>"
                            name="id"></td>
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
                <br /> <button type="submit" class="btn btn-lg btn-danger">Delete Cab</button>
                <br /> <br /> <br />
                <button class="btn btn-default btn-lg" onclick="goBack()">BACK</button>
            </form>
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
