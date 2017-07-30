package com.ibm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.AppDao;
import com.ibm.model.RegModel;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		RegModel obj = new RegModel();
		obj.setUname(uname);
		obj.setPwd(pwd);
		
		String sql = "select * from RegisterCust where uname = ? and pwd = ?";

		String msg = AppDao.ValidateUsers(sql, obj);
		HttpSession session = request.getSession();
		if(msg.equals("success"))
		{
			
			session.setAttribute("uname", uname);
			session.setAttribute("wrong_login",null);
			response.sendRedirect("bookCab1.jsp");
		}
		else
		{
			session.setAttribute("wrong_login","yes");
			response.sendRedirect("loginCust.jsp");
		}
		
	}

}
