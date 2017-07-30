<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel = "stylesheet" href = "http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <title>Add Cab</title>

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
                        <hr> <h2>UPLOAD CAB Details from CSV file.</h2> <hr>
                        <form enctype="multipart/form-data" method="post" action="UploadingCab.jsp" class="form-inline">
                          <br />
                          <div class="form-group">
                            <input type="file" class="form-control input-lg input-md" name="upload" />
                            <small class="text-muted">The name of the file to be uploaded is cab.txt</small>
                        </fieldset>
                    </div>
                    <br /> <br />
                    <div class="form-group">
                        <button type="submit" name="upload" value="Upload File" class="btn btn-lg btn-success">Upload File</button> 
                    </div> 

                </form>
            </div> 
            <br /> 
            <br />
            <hr> <h2>ADD Cab Details </h2> <hr> 
            <br />
            <form action="InsertCabServlet" method="post" class="col-xs-12">
            <center>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Cab Name </label>
                    <div class="col-sm-4">
                        <input required type="text" name="cabname" class="form-control" placeholder="Cab Name">
                    </div>
                </div>
                </center>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Cab Number </label>
                    <div class="col-sm-4">
                        <input required type="text" name="cabnumber" class="form-control" placeholder="Cab's license plate Number">
                        
                    </div>
                </div>
                <div class="form-group row ">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Cab Type </label>
                    <div class="col-sm-4 ">
                        <select name="cabtype" class="form-control">
                            <option value="AC CAR">AC CAR</option>
                            <option value="NON-AC CAR">NON-AC CAR </option>
                            <option value="AC SUV">AC SUV </option>
                            <option value="NON-ACSUV">NON-AC SUV </option>
                        </select>
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> No. of seats </label>
                    <div class="col-sm-4">
                        <input required type="text" name="cabname" class="form-control" placeholder="Seating capacity">
                        
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-offset-3 col-sm-2 form-control-label"> Cab Colour </label>
                    <div class="col-sm-4">
                        <input required type="text" name="cabname" class="form-control" placeholder="Cab body Colour">
                        
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-5 col-sm-2">
                    <br />
                      <button type="submit" class="btn btn-lg btn-success">Add to Database</button>
                  </div>
              </div>

              <br /> <br />
          </form>
          
          <button class="btn btn-default bt-lg" onclick="goBack()">BACK</button>
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
