<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register</title>

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

    </head>

    <body>
<script>
function checkMbno()
{
	var msg2 = document.getElementById('mobMessage');
	var badColor = "#ff6666";
	var mbno = document.getElementById('mbno').value;
	if(mbno.length!=10)
    {
    	msg2.style.color = badColor;
    	msg2.innerHTML = "Invalid mobile number!";
        document.getElementById("sb").disabled = true;
    }
    else
    {
    	msg2.innerHTML = "";
    	document.getElementById("sb").disabled = false;
    }
}
function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pwd1');
    var pass2 = document.getElementById('pwd2');
    
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(pass1.value == pass2.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
        	document.getElementById("sb").disabled = false;
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
        document.getElementById("sb").disabled = true;
    }
    
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
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="bookCab1.jsp">Book Cab</a>
                    </li>
                    <li>
                        <a href="loginCust.jsp">Login</a>
                    </li>                    
                    <li class="active">
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
            <div class="row">
                <div class="box">
                    <div class="col-xs-12">
                        <div class="container">
                        <div class="well bg-warning col-xs-11">   
                        <center> <h2> Register here </h2> </center>
                        </div>
                        </div>
                        <div class="container">
                            <form name="regForm "method="post" action="RegServlet">
                                <div class="form-group col-xs-5">
                                    <label for="element-1" class="control-label">Enter your Full Name:</label>
                                    <input required type="text" id="element-1" name="fullname" class="form-control" placeholder="Full Name">

                                </div>
                                <div class="form-group col-xs-offset-1 col-xs-5" >
                                    <label for="element-2" class="control-label">Enter your User Name:</label>
                                    <input required type="text" id="element-2" name="custname" class="form-control" placeholder="User Name">

                                </div>

                                <div class="form-group col-xs-5">
                                    <label for="element-3" class="control-label">Enter your Password:</label>
                                    <input required type="password" id="pwd1" name="pwd1" class="form-control" placeholder="Password length should be at least 6 characters.">
                                </div>

                                <div class="form-group col-xs-offset-1 col-xs-5" >
                                    <label for="element-4" class="control-label">Re-enter your Password:</label>
                                    <input required type="password" id="pwd2" name="pwd2" class="form-control" placeholder="Passwords should match." onkeyup="checkPass(); return false;">
									<span id="confirmMessage" class="confirmMessage"></span>
                                </div>

                                <div class="form-group col-xs-5" >
                                    <label for="element-5" class="control-label">Enter your Email:</label>
                                    <input required type="email" id="element-5" name="email" class="form-control" placeholder="Email:abcd@ex.com">

                                </div>

                                <div class="form-group col-xs-offset-1 col-xs-5" >
                                    <label for="element-6" class="control-label">Enter your Date of Birth:</label>
                                    <input required type="date" id="element-6" name="dob" class="form-control" placeholder="User Name">

                                </div>

                                <div class="form-group col-xs-5" >
                                    <label for="element-7" class="control-label">Enter your Mobile number:</label>
                                    <input required type="text" id="mbno" name="cmobno" class="form-control" placeholder="10 digit Mobile number" onkeyup="checkMbno(); return false;">
									<span id="mobMessage" class="mobMessage"></span>
                                </div>

                                <div class="form-group col-xs-offset-1 col-xs-5">
                                    <label for="element-8">City</label>
                                    <select class="form-control" id="element-8" name="city">
                                      <option>Delhi</option>
                                      <option>Bengaluru</option>
                                      <option>Mumbai</option>
                                      <option>Kolkata</option>
                                  </select>
                              </div>

                              <div class="form-group col-sm-offset-5 col-xs-5">
                                                            <br /> <br />
                                <button id="sb" type="submit" class="btn btn-primary btn-lg">Submit</button>
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
<script type="text/javascript" src="jquery-2.2.4.min.js"></script>
</body>

</html>
