package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.AppDao;
import com.ibm.model.DriverModel;

/**
 * Servlet implementation class UpdateDriverServlet
 */
@WebServlet("/UpdateDriverServlet")
public class UpdateDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDriverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String did = request.getParameter("did");
		String dname = request.getParameter("dname");
		String demail = request.getParameter("demail");
		String ddob = request.getParameter("ddob");
		String dno = request.getParameter("dno");
		String dcity = request.getParameter("dcity");
		String status = request.getParameter("status");
		
		DriverModel obj = new DriverModel();
		obj.setDcity(dcity);
		obj.setDdob(ddob);
		obj.setDemail(demail);
		obj.setDname(dname);
		obj.setDno(dno);
		obj.setStatus(status);
		
		String sql = "update driver set fullname = ?, email = ?, "
				+ " dob = ?, mobno = ?, city = ?, status = ?"+
				" where did = ?";
		
		String msg = AppDao.updateDriverDetails(did, sql, obj);
		
		if(msg.equals("success"))
		{
			
			response.sendRedirect("displayDrivers.jsp");
		}
		else
		{
			System.out.println("NOPE!");
			response.sendRedirect("updateDriver.jsp");
		}
	}

}
