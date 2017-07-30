package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.AppDao;
import com.ibm.model.CustModel;
import com.ibm.model.DriverModel;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
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
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String city = request.getParameter("city");
		String fullname = request.getParameter("fullname");
		String mobno = request.getParameter("mobno");
		
		CustModel obj = new CustModel();
		obj.setCity(city);
		obj.setDob(dob);
		obj.setEmail(email);
		obj.setFullname(fullname);
		obj.setMobno(mobno);
		obj.setPwd(pwd);
		obj.setUname(uname);
		
		String sql = "update registercust set uname = ?, pwd = ?, "
				+ " email = ?, dob = ?, city = ?, fullname = ?, mobno = ?"+
				" where uid = ?";
		
		String msg = AppDao.updateUserDetails(uid, sql, obj);
		
		if(msg.equals("success"))
		{
			response.sendRedirect("editUser.jsp");
		}
		else
		{
			System.out.println("NOPE!");
			response.sendRedirect("editUser.jsp");
		}
	}

}
