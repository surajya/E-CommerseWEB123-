package mvc.ecom.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import mvc.ecom.entity.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public int productSave(Product p) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		int pdId = (int) session.save(p);
		tx.commit();
		session.close();

		return pdId;
	}

	// Get all products
	public List<Product> getProduct() {
		Session session = factory.openSession();
		Query query = session.createQuery("from Product");
		List list = query.list();
		session.close();
		return list;
	}

	// Get all products By Id
	public List<Product> getProductById(int cid) {
		Session session = factory.openSession();
		Query query = session.createQuery("from Product as a where a.category.categoryId=:id");
		query.setParameter("id", cid);
		List list = query.list();
		session.close();
		return list;
	}
}
