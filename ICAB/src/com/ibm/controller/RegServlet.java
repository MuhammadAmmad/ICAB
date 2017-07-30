package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.AppDao;
import com.ibm.model.CustModel;
import com.ibm.model.RegModel;

@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//step-1
		
		/*String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd1");
		String email=request.getParameter("email");
		String dob=request.getParameter("dob");
		String city=request.getParameter("city");*/
		
		String uname=request.getParameter("custname");
		String pwd=request.getParameter("pwd1");
		String email=request.getParameter("email");
		String dob=request.getParameter("dob");
		String city=request.getParameter("city");
		String fullname=request.getParameter("fullname");
		String cmobno=request.getParameter("cmobno");
		
		//step-2
		CustModel obj = new CustModel();
		obj.setFullname(fullname);
		obj.setUname(uname);
		obj.setPwd(pwd);
		obj.setEmail(email);
		obj.setDob(dob);
		obj.setCity(city);
		obj.setMobno(cmobno);
		
		/*RegModel obj=new RegModel();
		obj.setUname(uname);
		obj.setPwd(pwd);
		obj.setEmail(email);
		obj.setDob(dob);
		obj.setCity(city);*/
		
		
		
		//Step-3
		String sql = "insert into RegisterCust(uname, pwd, email, dob, city, fullname, mobno)"+
		" values (?,?,?,?,?,?,?)";
		//step-4
		
		String msg=AppDao.InsertCustDetails(sql, obj);
		if(msg.equals("success"))
		{
			response.sendRedirect("loginCust.jsp");
		}
		else
		{
			response.sendRedirect("RegisterCust.jsp");
		}
	
	}

}
