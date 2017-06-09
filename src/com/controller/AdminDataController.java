package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Login;
import com.model.AdminDataBo;
import com.model.AdminLogin;
import com.model.DataBo;

/**
 * Servlet implementation class DataController
 */
@WebServlet("/AdminDataController")
public class AdminDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminDataController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String x = request.getParameter("username");
		String y = request.getParameter("password");
		AdminLogin loginobj1 = new AdminLogin();
		loginobj1.setusername(x);
		loginobj1.setPassword(y);
		System.out.println(x);
		System.out.println(y);
		AdminDataBo databusiness1 = new AdminDataBo();
		boolean business1 = databusiness1.validate(loginobj1);
		if (business1 == true)
		    request.getRequestDispatcher("admin.html").forward(request, response);    
		else
			request.getRequestDispatcher("Failure.jsp").forward(request,response);
			
	}

}