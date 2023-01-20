package com.infinite.insuranceNew;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;



@ManagedBean
@SessionScoped
public class CustomerDAO {
	
	
	SessionFactory sessionFactory;
	

	
	public List<Customer> showCustomer(){
		sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		//Criteria cr=session.createCriteria(Customer.class);
		Query query=session.createQuery("from Customer");
		List<Customer> customerList=query.list();
		//List<Customer> customerList=cr.list();
		return customerList;
			}
	
	//particular user
	public List<Customer> showCustomerUser( String customerId){
		sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Customer.class);
		cr.add(Restrictions.eq("customerId", customerId));
		List<Customer> customerList=cr.list();
		return customerList;
			}
	
	
	//generatecustid
public String generatePaymentId() {
		
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Customer.class);
		java.util.List<Customer> roomlist = cr.list();
		session.close();
		
		if(roomlist.size()==0) {
			return "C001";
		}
		else {
		String id = roomlist.get(roomlist.size()-1).getCustomerId();
		int id1 = Integer.parseInt(id.substring(1));
		id1++;
		String id2 = String.format("C%03d", id1);
		return id2;
		}
	}

public String addcustomer(Customer customer) {
	sessionFactory=SessionHelper.getConnection();
	Session session=sessionFactory.openSession();
	String payId=generatePaymentId();
	customer.setCustomerId(payId);
	Criteria cr=session.createCriteria(Customer.class);
	Transaction tr=session.beginTransaction();
	session.save(customer);
	tr.commit();
	return "CustomerID is  "+customer.getCustomerId() +"keep it confidential ";
	
}
	
public String updateCustomer(Customer customer ){
    sessionFactory=SessionHelper.getConnection();
    Session session=sessionFactory.openSession();

    Transaction transaction = session.beginTransaction();
    session.update(customer);
    transaction.commit();

    return "Update Customer";
}
  
   
   public Customer searchCustomerById(String customerId) {
	   sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Customer.class);
		cr.add(Restrictions.eq("customerId", customerId));
		List<Customer> cutlist=cr.list();
		return cutlist.get(0);
		//Transaction tr=session.beginTransaction();
	 
   }
   
   public String DeleteCustomer(String customerId){
	   sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Customer cust=searchCustomerById(customerId);
		Transaction tr=session.beginTransaction();
		session.delete(cust);
		tr.commit();
		return "deleted";
		
   }

}