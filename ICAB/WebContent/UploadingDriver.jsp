<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ibm.dao.*" %>
<%@ page import="com.ibm.model.*" %>
<% String email="abc@gmail.com"; %>
<% String saveFile=""; %>
<% String file1=""; %>
<% String date1=""; %>
<% int count=1; %>
<% String name=""; %>
<% String description=""; %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel = "stylesheet" href = "http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <title>uploadingDrivers</title>

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
                    <li ><a href="AdminCabPanel.jsp">Cabs</a></li>
                    <li class="active"><a href="AdminDriverPanel.jsp">Drivers</a></li>
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
                    <%
//++++++++++++++++++++++++++++=Task1

File file = new File("D:\\proj");
if (!file.exists()) {
    if (file.mkdir()) {
        out.println("Directory is created!");
    } else {
        System.out.println("Failed to create directory!");
    }
}

//++++++++++++++++++++++++++=Task2



String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
          DataInputStream in = new DataInputStream(request.getInputStream());
          
          int formDataLength = request.getContentLength();
          byte dataBytes[] = new byte[formDataLength];
          int byteRead = 0;
          int totalBytesRead = 0;
          while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
                  }
          String filex = new String(dataBytes);
         
          saveFile = filex.substring(filex.indexOf("filename=\"") + 10);
          saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
          saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
          int lastIndex = contentType.lastIndexOf("=");
          String boundary = contentType.substring(lastIndex + 1,contentType.length());
          int pos;
          pos = filex.indexOf("filename=\"");
          pos = filex.indexOf("\n", pos) + 1;
          pos = filex.indexOf("\n", pos) + 1;
          pos = filex.indexOf("\n", pos) + 1;
          int boundaryLocation = filex.indexOf(boundary, pos) - 4;
          int startPos = ((filex.substring(0, pos)).getBytes()).length;
          int endPos = ((filex.substring(0, boundaryLocation))
.getBytes()).length;
       
          FileOutputStream fileOut = new FileOutputStream("D:\\proj\\"+saveFile); 
          fileOut.write(dataBytes, startPos, (endPos - startPos));
          fileOut.flush();
          fileOut.close();
          

          }


//+++++++++++++++++++++++++++++++++++TASK3

        String path="D:\\proj\\driver.txt";
        String  strLine="";
        FileInputStream fstream = new FileInputStream(path);
        DataInputStream in = new DataInputStream(fstream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));

try
    {       
       out.println("<h2> <span class='label label-success'>List Updated successfully!</span> </h2>");
        int c=1;
        
        ArrayList A=new ArrayList();
        ArrayList B=new ArrayList();
        ArrayList C=new ArrayList();
        ArrayList D=new ArrayList();
        ArrayList E=new ArrayList();
        ArrayList F=new ArrayList();
        
        while((strLine=br.readLine())!=null)
        {
            
             
             
             StringTokenizer tokenizer = new StringTokenizer(strLine," ");
                while(tokenizer.hasMoreTokens())
                {               
                    A.add(tokenizer.nextToken().replace("_", " "));
                    B.add(tokenizer.nextToken());
                    C.add(tokenizer.nextToken());
                    D.add(tokenizer.nextToken());
                    E.add(tokenizer.nextToken());
                    F.add(tokenizer.nextToken());
                    
                }
             
             }
        
        
         
        
        DriverModel obj = new DriverModel();
        String sql="insert into driver(fullname,email,dob,mobno,city,status)values(?,?,?,?,?,?)";
         for(int i=0;i<A.size();i++)
            {
                String a=A.get(i).toString();
                String b=B.get(i).toString();
                String c1=C.get(i).toString();
                String d=D.get(i).toString();
                String e=E.get(i).toString();
                String f=F.get(i).toString();
                obj.setDname(a);
                obj.setDemail(b);               
                obj.setDdob(c1);
                obj.setDno(d);
                obj.setDcity(e);
                obj.setStatus(f);
                //System.out.println(AppDao.InsertDriverDetails(sql, obj));
                AppDao.InsertDriverDetails(sql, obj);
          }
              
//++++++++++++++++++++++++++++++++Task4
}
catch(Exception e)
{
    out.println(e);
}
%>  

                        <hr> <h2> DRIVER details </h2> <hr>
    <div class="col-lg-10 col-lg-offset-1">
            
                <table class="table table-hover" width="635" height="68">
                 <thead class="thead-inverse">
                    <tr>
                            <th width="18">ID</th>
                            <th width="104">FULL NAME</th>
                            <th width="154">EMAIL</th>
                            <th width="94">DOB</th>
                            <th width="112">MOB. NO. </th>
                            <th width="76">CITY</th>
                            <th width="81">STATUS</th>
    </tr>
  </thead>
  <tbody>
                    <% 
                        String sql="select * from driver";

                        ResultSet ds=AppDao.FetchAllDrecords(sql);

                        while(ds.next()){
                        %>
                    <tr>
                            <td><%=ds.getString(1) %></td>
                            <td><%=ds.getString(2) %></td>
                            <td><%=ds.getString(3) %></td>
                            <td><%=ds.getString(4) %></td>
                            <td><%=ds.getString(5) %></td>
                            <td><%=ds.getString(6) %></td>
                            <td><%=ds.getString(7) %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
              </table>
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
