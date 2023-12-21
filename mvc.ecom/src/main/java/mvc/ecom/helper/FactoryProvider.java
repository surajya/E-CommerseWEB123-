package mvc.ecom.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory factory;

	public static SessionFactory getFactory() {
		try {
			if (factory == null) {
				factory = new Configuration().configure("hibernate.config.xml").buildSessionFactory();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return factory;
	}
}
