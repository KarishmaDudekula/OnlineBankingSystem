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

import com.model.Nominee;
import com.model.NomineeDataBo;

/**
 * Servlet implementation class NomineeDataController
 */
@WebServlet("/NomineeDataController")
public class NomineeDataController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NomineeDataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-genera7ted method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String x = request.getParameter("nominee_name");
		String y = request.getParameter("nominee_age");
		String p = request.getParameter("email_id");
		String q = request.getParameter("aadhar");
		String r = request.getParameter("pancardnumber");
		String s = request.getParameter("gender");
		String t = request.getParameter("dateOfBirth");
		String l = request.getParameter("phonenumber");
		String n = request.getParameter("address");
		String u = request.getParameter("occupation");
		String v = request.getParameter("marital_status");
		String b = request.getParameter("state");
		String c = request.getParameter("country");
		String d = request.getParameter("pincode");
		Nominee register= new Nominee();
		register.setNominee_name(x);
		register.setNominee_age(y);
		register.setEmail_id(p);
		register.setAadhaar(q);
		register.setPancardnumber(r);
		register.setGender(s);
		register.setDateofBirth(t);
		register.setPhonenumber(l);
		register.setAddress(n);
		register.setOccupation(u);
		register.setMarital_status(v);
		register.setState(b);
		register.setCountry(c);
		register.setPincode(d);
		NomineeDataBo business = new NomineeDataBo();
		boolean b1=business.validateAndSave(register);
		System.out.println(b1);
		HttpSession session = request.getSession(true);
	    session.setAttribute("currentcustomerid", x);
		if(b1 ==true){
			out.println("<script type=\"text/javascript\">");
        out.println("alert('Successfully added nominee');");
        out.println("</script>");
	    RequestDispatcher r1 = request.getRequestDispatcher("customer.html");
	   r1.include(request, response);
		}	else {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Not added');");
	        out.println("</script>");
		}
		}

}