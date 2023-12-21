package mvc.ecom.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import mvc.ecom.entity.User;
import mvc.ecom.helper.FactoryProvider;

public class UserDao {
	User user = null;
	SessionFactory sf = null;

	public void getSessionFactory(SessionFactory factory) {
		this.sf = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {

		try {
			String query = "from User where userEmail=:e and userPassword=:p";
			Session session = sf.openSession();
			Query q = session.createQuery(query);

			q.setParameter("e", email);
			q.setParameter("p", password);
			user = (User) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	
	//Get All users
	public static int TotalUsers() {
		SessionFactory factory = FactoryProvider.getFactory();
		Session s = factory.openSession();
		Query createQuery = s.createQuery("from User");
		List list = createQuery.list();
		return list.size();
	}
}
