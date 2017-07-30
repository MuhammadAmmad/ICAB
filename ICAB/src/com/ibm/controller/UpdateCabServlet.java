package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.AppDao;
import com.ibm.model.CabModel;

/**
 * Servlet implementation class UpdateCabServlet
 */
@WebServlet("/UpdateCabServlet")
public class UpdateCabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCabServlet() {
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
		String cabid = request.getParameter("cabid");
		String cabname = request.getParameter("cabname");
		String cabnumber = request.getParameter("cabnumber");
		String cabtype = request.getParameter("cabtype");
		String nseats = request.getParameter("nseats");
		String cabcolor = request.getParameter("cabcolor");
		String status = request.getParameter("status");
		
		CabModel obj = new CabModel();
		obj.setCabname(cabname);
		obj.setCabcolor(cabcolor);
		obj.setCabnumber(cabnumber);
		obj.setCabtype(cabtype);
		obj.setNseats(nseats);
		obj.setStatus(status);
		
		String sql = "update cab set cabname = ?,"+
		" cabnumber = ?, cabtype = ?, nseats = ?, cabcolor = ?, status = ?"+
				" where cabid = ?";
		
		String msg = AppDao.updateCabDetails(cabid, sql, obj);
		
		if(msg.equals("success"))
		{
			
			response.sendRedirect("displayCabs.jsp");
		}
		else
		{
			System.out.println("NOPE!");
			response.sendRedirect("updateCab.jsp");
		}
		
		
		
	}

}
