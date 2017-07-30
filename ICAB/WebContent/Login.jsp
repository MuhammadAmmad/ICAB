<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
input
{
background-color:yellowl;
width: 100px;
color:blue;
}
</style>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-2.2.4.min.js"></script>
<script>
   $(document).ready(function()
		   {
	                 alert("my jquey is working");
	                $("input").mouseenter(function()
	                		{
	                	      // alert("mouse event is working");
	                	       $("input").css("background-color","pink");
	                	       $("input").css("width","500px");
	                	      
	                		});
	                $("input").mouseleave(function()
	                		{
	                	      // alert("mouse event is working");
	                	       $("input").css("background-color","yellow");
	                	       $("input").css("width","200px");
	                	
	                		});
	   
	   
		   });

</script>
</head>
<body>
<center>
<h1>USER LOGIN</h1>
<form action="LoginServlet" method="post">
<table>
<tr><td>USERNAME</td><td><input type="text" name="uname" /></td></tr>
<tr><td>PASSWORD</td><td><input type="password" name="pwd" /></td></tr>
<tr><td></td><td><input type="submit" value="LOGIN"></td></tr>
</table>
</form>
<%
    if(request.getParameter("var")!=null)
    {
    	
    	out.println("<h1><font color='red'>"+request.getParameter("var")+"</font><h1>");
    }

%>
</center>


</body>
</html>