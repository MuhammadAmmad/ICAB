package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.AppDao;

/**
 * Servlet implementation class DeleteCabServlet
 */
@WebServlet("/DeleteCabServlet")
public class DeleteCabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCabServlet() {
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
		String id = request.getParameter("id");
		
		String sql = "delete from cab where cabid = ?";
		
		String msg = AppDao.deleteCab(id, sql);
		
		if(msg.equals("success"))
		{
			
			response.sendRedirect("delCab.jsp");
		}
		else
		{
			System.out.println("NOPE!");
			response.sendRedirect("delCab.jsp");
		}
	}

}
