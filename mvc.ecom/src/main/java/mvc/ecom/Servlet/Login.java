package mvc.ecom.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.ecom.dao.UserDao;
import mvc.ecom.entity.User;
import mvc.ecom.helper.FactoryProvider;

public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter pw=response.getWriter()){
			
			//get value from browser
			String eamil=request.getParameter("userEmail");
			String password=request.getParameter("userPassword");
			
			//authentication
			UserDao ud=new UserDao();
			ud.getSessionFactory(FactoryProvider.getFactory());
			User u=ud.getUserByEmailAndPassword(eamil, password);
			HttpSession session=request.getSession();
			//verifying
			if(u==null) {
				
				session.setAttribute("message", "invalid Details please enter correct details!!  ");
				response.sendRedirect("login.jsp");
			}else {
				session.setAttribute("current_user",u);
				pw.println("user type are: "+u.getUserType());
				if(u.getUserType().equals("Normal")) response.sendRedirect("normal.jsp");
				else if(u.getUserType().equals("Admin")) response.sendRedirect("admin.jsp");
				else pw.println("<h1>user type are not identify, please enter correct details!!</h1>");
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
