package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.*;
import com.ibm.model.*;

@WebServlet("/InsertCabServlet")
public class InsertCabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InsertCabServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//step-1
		
		String cabname=request.getParameter("cabname");
		String cabnumber=request.getParameter("cabnumber");
		String cabtype=request.getParameter("cabtype");
		String nseats=request.getParameter("nseats");
		String cabcolor=request.getParameter("cabcolor");
		
		
		//step-2
		
		CabModel obj=new CabModel();
		obj.setCabname(cabname);
		obj.setCabnumber(cabnumber);
		obj.setCabtype(cabtype);
		obj.setNseats(nseats);
		obj.setCabcolor(cabcolor);
		
		
		
		//Step-3
		String sql="insert into CAB(cabname,cabnumber,cabtype,nseats,cabcolor)values(?,?,?,?,?)";
		
		//step-4
		
		String msg=AppDao.InsertCabDetails(sql, obj);
		if(msg.equals("success"))
		{
			response.sendRedirect("displayCabs.jsp");
		}
		else
		{
			response.sendRedirect("addCab.jsp");
		}

	}

}
