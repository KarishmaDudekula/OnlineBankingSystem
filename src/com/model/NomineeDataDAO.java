package com.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NomineeDataDAO
 */
@WebServlet("/NomineeDataDAO")

public class NomineeDataDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NomineeDataDAO() {
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
	}
	
	public boolean save(Nominee register){
		int noOfRowsAffected = 0;
		String nominee_name = register.getNominee_name();
		String nominee_age = register.getNominee_age();
		String email_id = register.getEmail_id();
		String aadhar= register.getAadhaar();
		String pancardnumber= register.getPancardnumber();
		String gender= register.getGender();
		String dateOfBirth= register.getDateofBirth();
		String phonenumber= register.getPhonenumber();
		String occupation= register.getOccupation();
		String marital_status = register.getMarital_status();
		String address= register.getAddress();
		String state= register.getState();
		String country= register.getCountry();
		String pincode= register.getPincode();
		
		String sql = "insert into nomineee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root","pooja10");
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nominee_name);
			pstmt.setString(2, nominee_age);
			pstmt.setString(3, email_id);	
			pstmt.setString(4, aadhar);
			pstmt.setString(5, pancardnumber);
			pstmt.setString(6, gender);
			pstmt.setString(7, dateOfBirth);
			pstmt.setString(8, phonenumber);
			pstmt.setString(9, address);
			pstmt.setString(10, occupation);                                          
			pstmt.setString(11, marital_status);
			pstmt.setString(12, state);
			pstmt.setString(13, country);
			pstmt.setString(14, pincode);
			noOfRowsAffected = pstmt.executeUpdate();
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (noOfRowsAffected > 0){
		    return true;
		}
		return false;
	}
	
}
	