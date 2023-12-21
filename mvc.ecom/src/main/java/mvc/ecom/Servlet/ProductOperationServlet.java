package mvc.ecom.Servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mvc.ecom.dao.CategoryDao;
import mvc.ecom.dao.ProductDao;
import mvc.ecom.entity.Category;
import mvc.ecom.entity.Product;
import mvc.ecom.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		try{
			
			String op=request.getParameter("operation");
			System.out.println("op value: "+op);
			if(op.trim().equals("addCategory")) {
				String title=request.getParameter("catTitle");
				String discription=request.getParameter("catDiscription");
				
				Category cat=new Category();
				cat.setCategoryTitle(title);
				cat.setCategoryDiscription(discription);
				//category save
				CategoryDao catdao=new CategoryDao(FactoryProvider.getFactory());
				int catId = catdao.categorySave(cat);
				
				//send redirect to admin page
				HttpSession session = request.getSession();
				session.setAttribute("message","category are saved successfully: "+catId);
				response.sendRedirect("admin.jsp");
				return;
			}
			else if(op.trim().equals("addProduct")) {
				String title =request.getParameter("pName");
				String dis =request.getParameter("pDiscription");
				int  price=Integer.parseInt(request.getParameter("pPrice"));
				int  discount=Integer.parseInt(request.getParameter("pDiscount"));
				int quantity =Integer.parseInt(request.getParameter("pQuantity"));
				int Cid =Integer.parseInt(request.getParameter("CID"));
				Part part=request.getPart("pPic");
                
				//get category
				CategoryDao cd=new CategoryDao(FactoryProvider.getFactory());
				Category cdd=cd.getCategoryById(Cid);
				
				Product p=new Product();
				p.setpTitle(title);
				p.setpDiscount(discount);
				p.setpPrice(price);
				p.setpDesc(dis);
				p.setpQuantity(quantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				p.setCategory(cdd);
				
				//save product here
				ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				int pId = pdao.productSave(p);
				
			
				String path=request.getRealPath("img")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				try {
					//upload code..
					FileOutputStream fos=new FileOutputStream(path);
					InputStream is=part.getInputStream();
					
					//reading date
					byte[] data=new byte[is.available()];
					is.read(data);
					
					//writing the data
					fos.write(data);
					
					fos.close();
					
					System.out.println("@@image upload successfully");
					
				} catch (Exception e) {
					System.out.println("this is expception:: "+e);
				}
				
				System.out.println("@@product save successfully");
				//send redirect to admin page
				HttpSession session = request.getSession();
				session.setAttribute("message","Product are saved successfully: "+pId);
				response.sendRedirect("admin.jsp");
				return;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			pw.println(e);
		}
	}

}
