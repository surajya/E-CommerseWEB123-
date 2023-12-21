package mvc.ecom.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mvc.ecom.entity.User;
import mvc.ecom.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	
	FactoryProvider factory=new FactoryProvider();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		try {
			
			String userName=request.getParameter("userName");
			String userPassword=request.getParameter("userPassword");
			String userPhone=request.getParameter("userPhone");
			String userEmail=request.getParameter("userEmail");
			String userAddress=request.getParameter("userAddress");
			
			User user=new User(userName,userPassword,userPhone,userEmail,userAddress,"Admin");
			
			try {
				SessionFactory sf= factory.getFactory();
				Session session=sf.openSession();
				
				
				Transaction tx=session.beginTransaction();
				int userid=(int)session.save(user);
				
				tx.commit();
				session.close();
				HttpSession http_Session=request.getSession();
				http_Session.setAttribute("message", "Registraction Successfully!!  "+userid);
				response.sendRedirect("register.jsp");
				return;
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
