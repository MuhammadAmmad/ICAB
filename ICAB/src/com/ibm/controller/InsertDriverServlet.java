package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.AppDao;
import com.ibm.model.DriverModel;
import com.ibm.model.RegModel;


@WebServlet("/InsertDriverServlet")
public class InsertDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public InsertDriverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//step-1
		
				String dname=request.getParameter("dname");
				String dno=request.getParameter("dno");
				String demail=request.getParameter("demail");
				String ddob=request.getParameter("ddob");
				String dcity=request.getParameter("dcity");
				String status=request.getParameter("status");
				
				
				//step-2
				
				DriverModel obj=new DriverModel();
				obj.setStatus(status);
				obj.setDname(dname);
				obj.setDno(dno);
				obj.setDemail(demail);
				obj.setDdob(ddob);
				obj.setDcity(dcity);
				
				//Step-3
				String sql="insert into DRIVER(FULLNAME,EMAIL,DOB,MOBNO,CITY,STATUS)values(?,?,?,?,?,?)";
				
				//step-2
				
				String msg=AppDao.InsertDriverDetails(sql, obj);
				if(msg.equals("success"))
				{
					response.sendRedirect("displayDrivers.jsp");
				}
				else
				{
					response.sendRedirect("addDriver.jsp");
				}
				
				
				
				
	}

}
