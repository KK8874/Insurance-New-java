package com.infinite.insuranceNew;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

@ManagedBean
@SessionScoped
public class InsDAO {
	SessionFactory sessionFactory;
	
	public int loginCheck(String userName, String passWord) {
		sessionFactory = SessionHelper.getConnection();

		Session session = sessionFactory.openSession(); 
		Criteria cr = session.createCriteria(AgentLogin.class);
		cr.add(Restrictions.eq("userName", userName));
		cr.add(Restrictions.eq("passWord", passWord));
		List<AgentLogin> listUsers = cr.list();
		return listUsers.size();
	}
//	
//	//Customer login
//	public int CustomerloginCheck(String customerId, String customerEmail) {
//		sessionFactory = SessionHelper.getConnection();
//		Session session = sessionFactory.openSession(); 
//		Criteria cr = session.createCriteria(Customer.class);
//		cr.add(Restrictions.eq("customerId", customerId));
//		cr.add(Restrictions.eq("customerEmail", customerEmail));
//		List<Customer> listUsers = cr.list();
//		return listUsers.size();
//	}
	
	
	//Customer login1
		public int Customerlogin(String customerId, String passWord) {
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession(); 
			Criteria cr = session.createCriteria(Customer.class);
			cr.add(Restrictions.eq("customerId", customerId));
			cr.add(Restrictions.eq("passWord", passWord));
			List<Customer> listUsers = cr.list();
			return listUsers.size();
		}
		
		//Customer forgetpassword
				public int forgetPassword1(String customerId, String passWord) {
					sessionFactory = SessionHelper.getConnection();
					Session session = sessionFactory.openSession(); 
					Criteria cr = session.createCriteria(Customer.class);
					cr.add(Restrictions.eq("customerId", customerId));
					cr.add(Restrictions.eq("passWord", passWord));
					List<Customer> listUsers = cr.list();
					return listUsers.size();
				}
			
				public void forgetPassword(String customerId, String passWord ){
					sessionFactory = SessionHelper.getConnection();
					Session session = sessionFactory.openSession();
				      Transaction tx = null;
				      try{
				         tx = session.beginTransaction();
				         Customer customer=(Customer)session.get(Customer.class,customerId);
				         customer.setPassWord(passWord);
				         
				         session.update(customer); 
				         tx.commit();
				      }catch (HibernateException e) {
				         if (tx!=null) tx.rollback();
				         e.printStackTrace(); 
				      }
				   }


}
