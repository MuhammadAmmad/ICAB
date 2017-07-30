<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Login</title>

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
    </style>
    </head>

    <body>
        <%
  if(session.getAttribute("admin")!=null)
  {
      response.sendRedirect("AdminPanel.jsp");
  }
  
  
  %>
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
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li ><a href="index.html">Home</a></li>
                    <li><a href="bookCab1.jsp">Book Cab</a></li>
                    <li><a href="loginCust.jsp">Login</a> </li>
                    <li><a href="RegisterCust.jsp">Register</a> </li>
                    <li class="active"><a href="AdminLogin.jsp">Admin Login</a></li>
                    <li class="last"><a href="logoutCust.jsp">Logout</a> </li>
                </ul>
            </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div class="container">
            <div class="row">
                <div class="box">
                    <div class="col-xs-12">
                        <div class="container">
                        <div class="well bg-warning col-xs-11">   
                        <center> <h2> Admin Login </h2> </center>
                        </div>
                        </div>
                        <div class="container">
                            <form method="post" action="AdminLoginServlet">
                                
                                <div class="form-group col-xs-11" >
                                    <label for="element-1" class="control-label">Enter your User Name:</label>
                                    <input type="text" id="element-1" name="username" class="form-control">

                                </div>

                                <div class="form-group col-xs-11">
                                    <label for="element-2" class="control-label">Enter your Password:</label>
                                    <input type="password" id="element-2" name="password" class="form-control">
                                </div>
                              <div class="col-sm-offset-5 form-group col-xs-11">
                                <button type="submit" class="btn btn-warning btn-lg">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
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

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
