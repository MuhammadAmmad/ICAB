package com.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.AppDao;
import com.ibm.model.ContactMsg;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		String msg=request.getParameter("msg");
		
		ContactMsg obj = new ContactMsg();
		
		obj.setEmail(email);
		obj.setMsg(msg);
		obj.setName(name);
		obj.setTel(tel);
		
		String sql = "insert into contact (name, email, tel, msg) values (?,?,?,?)";
		String mesg = AppDao.addContactMsg(sql, obj);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		if(mesg.equals("success"))
		{
			response.sendRedirect("index.html");
		}
		else
		{
			response.sendRedirect("index.html");
		}
		
	}

}
