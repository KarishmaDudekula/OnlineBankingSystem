package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Login;

import com.model.DataBo;

/**
 * Servlet implementation class DataController
 */
@WebServlet("/DataController")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DataController() {
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
		String x = request.getParameter("customer_id");
		String y = request.getParameter("password");
		PrintWriter out = response.getWriter();
		Login loginobj = new Login();
		loginobj.setcustomer_id(x);
		loginobj.setPassword(y);
		System.out.println(x);
		System.out.println(y);
		DataBo databusiness = new DataBo();
		boolean business = databusiness.validate(loginobj);
		HttpSession session = request.getSession(true);
	    session.setAttribute("currentcustomerid", x);
		System.out.println(business);
		if (business == true){
		    request.getRequestDispatcher("customer.html").forward(request, response);    
   	        
		} else {
			out.println("<script type=\"text/javascript\">");
            out.println("alert('User or password incorrect');");
            out.println("</script>");
    	    RequestDispatcher r = request.getRequestDispatcher("customerLogin.html");
    	   r.include(request, response);
		}
    	
			
	}

}