package mvc.ecom.dao;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import mvc.ecom.entity.Category;

public class CategoryDao {

	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory=factory;
	}
	
	public int categorySave(Category cat) {
		Session session = factory.openSession();
		Transaction tx=session.beginTransaction();
		int catId=(int)session.save(cat);
		tx.commit();
		session.close();
		
		return catId;
	}
	
	public List<Category> getCategory(){
		Session session = factory.openSession();
		Query query = session.createQuery("from Category");
		List list = query.list();
		session.close();
		return list;
	}
	
	public Category getCategoryById(int cid) {
		Category category=null;
		try {
			Session session = factory.openSession();
			category = session.get(Category.class, cid);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return category;
	}
}
