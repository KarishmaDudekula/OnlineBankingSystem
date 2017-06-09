package com.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.AdminLogin;

/**
 * Servlet implementation class DataDAO
 */
@WebServlet("/AdminDataDAO")
public class AdminDataDAO extends HttpServlet {
    public boolean save(AdminLogin data){
        String admin_id = data.getusername();
        String password = data.getPassword();
        System.out.println(admin_id);
        System.out.println(password);
        //String UserNameDB = "";
       // String passwordDB = "";
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem", "root","pooja10");
            statement  = con.createStatement();
            resultSet = statement.executeQuery("select * from admin_login where admin_id = '" + admin_id +"'");
            
            if(resultSet.next()){
                //UserNameDB = resultSet.getString("UserName"); //fetch the values present in database
            	   return true;
            } else {
                return false;
            }
            	             
                
        }
        catch(SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
       return false;
    }
    private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDataDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    //    doGet(request, response);
    	request.setAttribute("alertMsg", "data add sucess");
    }

}