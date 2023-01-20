package com.infinite.insuranceNew;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class DummyDAO {
SessionFactory sessionFactory;
	
	
	//generate payment id
public String generatePaymentId() {
		
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Payment.class);
		java.util.List<Payment> roomlist = cr.list();
		session.close();
		
		if(roomlist.size()==0) {
			return "Q001";
		}
		else {
		String id = roomlist.get(roomlist.size()-1).getPaymentntId();
		int id1 = Integer.parseInt(id.substring(1));
		id1++;
		String id2 = String.format("Q%03d", id1);
		return id2;
		}
	}


	

	//SearchpolicyId from policy table
	
	public Policy searchById(String policyId) {
		sessionFactory = SessionHelper.getConnection();
  		Session session = sessionFactory.openSession(); 
  		Criteria cr = session.createCriteria(Policy.class);
  		cr.add(Restrictions.eq("policyId", policyId));
  		List<Policy> PolicyList = cr.list();
  		return PolicyList.get(0);
	}
	
	//searchbookingid from booking details
	
	public BookingDetails searchByBookId(String bid) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(BookingDetails.class);
		criteria.add(Restrictions.eq("bookingId", bid));
		java.util.List<BookingDetails> BookIdlist = criteria.list();
		System.out.println(BookIdlist.size());
		BookingDetails booking = BookIdlist.get(0);
		return booking;
	}
	
	///searchBookingdetails policy Name
	public BookingDetails searchByBookPolicyName(String policyName) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(BookingDetails.class);
		criteria.add(Restrictions.eq("policyName", policyName));
		java.util.List<BookingDetails> BookIdlist = criteria.list();
		System.out.println(BookIdlist.size());
		BookingDetails booking = BookIdlist.get(0);
		return booking;
	}
	
	//searchBookingID from paymentTable
	public List<Payment> searchPaymentBookId(String bid)  {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Payment.class);
		criteria.add(Restrictions.eq("bookingId", bid));
		java.util.List<Payment> BookIdlist = criteria.list();
		return BookIdlist;
	}
	//search policyname in payment
	public List<Payment> searchPaymentpolicyName(String policyName)  {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Payment.class);
		criteria.add(Restrictions.eq("policyName", policyName));
		java.util.List<Payment> BookIdlist = criteria.list();
		return BookIdlist;
	}

	//searchBookingID from paymentTable jsf search
	public String searchPaymentBookId1(String bid) throws ClassNotFoundException, SQLException {
		
			Map<String, Object> sessionMap = 
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			Criteria criteria = session.createCriteria(Payment.class);
			criteria.add(Restrictions.eq("bookingId", bid));
			List<Payment> BookIdlist = criteria.list();
			System.out.println(BookIdlist.size());
			Payment booklist=BookIdlist.get(0);
			sessionMap.put("payment",booklist);
			return "/PaymentDetails.xhtml?faces-redirect=true";
		}

	//confirmation of payment 
	
	public String confirmPayment(Payment payment) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(payment);
		transaction.commit();
		return "Payment Processed Successfully...";
	}
	

	//payment information for making payment
	public Payment paymentInfo(String policyName) {
		String pid = generatePaymentId();
		BookingDetails bookingDetails =searchByBookPolicyName(policyName);
		String paymode = bookingDetails.getPayMode();
		Payment objPayment = new Payment();
		objPayment.setPolicyName(policyName);
		objPayment.setPaymentntId(pid);
		objPayment.setBookingId(bookingDetails.getBookingId());
		objPayment.setPolicyId(bookingDetails.getPolicyID());
		objPayment.setCustomerId(bookingDetails.getCustomerId());
		Policy objPolicy = searchById(bookingDetails.getPolicyID());
		double premiumAmount = objPolicy.getPremiumAmount();
		System.out.println("Premium  " +premiumAmount);
		double installment = 0;
		objPayment.setTotalAmountToPayInEveryMode(installment);
		java.util.Date utilToday = new java.util.Date();
		Date today = new Date(utilToday.getTime());
		objPayment.setPaymentDate(today);
		
		List<Payment> payments = searchPaymentBookId(policyName);
		int count = payments.size();
		System.out.println("Count is  " +count);
		Date nextPayment;
		Date lastPayment;
		if (count==0) {
			if (paymode.equals("QUARTERLY")) {
				installment = premiumAmount/4;
				objPayment.setTotalAmountToPayInEveryMode(installment);
				lastPayment = bookingDetails.getBookingDate();
				 java.util.Date utilDate = new java.util.Date (lastPayment.getTime ());
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		          String strDate = sdf.format(utilDate);
			        
		  
			        Calendar cal = Calendar.getInstance();  
			        try{  
			           cal.setTime(sdf.parse(strDate));  
			        }catch(ParseException e){  
			            e.printStackTrace();  
			         } 
			         
			        cal.add(Calendar.MONTH, 3);  
			        String dateAfter = sdf.format(cal.getTime());  
			        try {
						utilDate = sdf.parse(dateAfter);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
			       nextPayment = new Date(utilDate.getTime());
			       System.out.println("Next Payment is  " +nextPayment);
			       objPayment.setNextDayPayment(nextPayment);
			}
			
			if (paymode.toUpperCase().equals("HALFYEARLY")) {
				installment = premiumAmount/2;
				objPayment.setTotalAmountToPayInEveryMode(installment);
				System.out.println("Premium Inner " +premiumAmount);
				System.out.println("Installment  " +installment);
				lastPayment = bookingDetails.getBookingDate();
				 java.util.Date utilDate = new java.util.Date (lastPayment.getTime ());
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		          String strDate = sdf.format(utilDate);
			       
			        Calendar cal = Calendar.getInstance();  
			        try{  
			           cal.setTime(sdf.parse(strDate));  
			        }catch(ParseException e){  
			            e.printStackTrace();  
			         }  
			             
			       
			        cal.add(Calendar.MONTH, 6);  
			        String dateAfter = sdf.format(cal.getTime());  
			        try {
						utilDate = sdf.parse(dateAfter);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
			       nextPayment = new Date(utilDate.getTime());
			       System.out.println("Next Payment is  " +nextPayment);
			       objPayment.setNextDayPayment(nextPayment);
			}

		
		} else {
			System.out.println("Already Exists Block");
			Payment lastRecord = payments.get(payments.size()-1);
			lastPayment = lastRecord.getNextDayPayment();
			System.out.println("Last Payment "+lastPayment);
			objPayment.setPaymentDate(lastPayment);
			System.out.println("Payment Q  " +paymode);
			if (paymode.equals("QUARTERLY")) {
				installment = premiumAmount/4;
				objPayment.setTotalAmountToPayInEveryMode(installment);
			//	lastPayment = bookingDetails.getBookingDate();
				 java.util.Date utilDate = new java.util.Date (lastPayment.getTime ());
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		          String strDate = sdf.format(utilDate);
			        //create instance of the Calendar class and set the date to the given date  
			        Calendar cal = Calendar.getInstance();  
			        try{  
			           cal.setTime(sdf.parse(strDate));  
			        }catch(ParseException e){  
			            e.printStackTrace();  
			         }  
			        
			        cal.add(Calendar.MONTH, 3);  
			        String dateAfter = sdf.format(cal.getTime());  
			        try {
						utilDate = sdf.parse(dateAfter);
					} catch (ParseException e) {
					
						e.printStackTrace();
					}
			       nextPayment = new Date(utilDate.getTime());
			       System.out.println("Next Payment is  " +nextPayment);
			       objPayment.setNextDayPayment(nextPayment);
			}
			if (paymode.toUpperCase().equals("HALFYEARLY")) {
				installment = premiumAmount/2;
				objPayment.setTotalAmountToPayInEveryMode(installment);
				System.out.println("Premium Inner " +premiumAmount);
				System.out.println("Installment  " +installment);
			//	lastPayment = bookingDetails.getBookingDate();
				System.out.println("Inner Last payment  " +lastPayment);
				objPayment.setPaymentDate(lastPayment);
				 java.util.Date utilDate = new java.util.Date (lastPayment.getTime ());
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		          String strDate = sdf.format(utilDate);
			        //create instance of the Calendar class and set the date to the given date  
			        Calendar cal = Calendar.getInstance();  
			        try{  
			           cal.setTime(sdf.parse(strDate));  
			        }catch(ParseException e){  
			            e.printStackTrace();  
			         }   
			        cal.add(Calendar.MONTH, 6);  
			        String dateAfter = sdf.format(cal.getTime());  
			        System.out.println(dateAfter);
			        try {
						utilDate = sdf.parse(dateAfter);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
			       nextPayment = new Date(utilDate.getTime());
			       System.out.println("Next Payment is  " +nextPayment);
			       objPayment.setNextDayPayment(nextPayment);
			}
		}
		return objPayment; 
	}
	//convert date formate
	public Date convertDate(String strDate) throws ParseException {
		java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
		return new Date(utilDate.getTime());
	}
	

	 //show all payment
		public List<Payment> showPayment(){
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			Criteria cr=session.createCriteria(Payment.class);
			//cr.add(Restrictions.eq("customerId", customerId));
			List<Payment> paymentList=cr.list();
			return paymentList;
			}
		
		//payment for particular customer
		public List<Payment> showPaymentUser( String customerId){
			sessionFactory=SessionHelper.getConnection();
			Session session=sessionFactory.openSession();
			Criteria cr=session.createCriteria(Payment.class);
			cr.add(Restrictions.eq("customerId", customerId));
			List<Payment> paymentList=cr.list();
			return paymentList;
				}
	
		
		//particular customer
				public List<LapsedPolicy> showLapsedUser( String customerId){
					sessionFactory=SessionHelper.getConnection();
					Session session=sessionFactory.openSession();
					Criteria cr=session.createCriteria(LapsedPolicy.class);
					cr.add(Restrictions.eq("customerId", customerId));
					List<LapsedPolicy> paymentList=cr.list();
					return paymentList;
						}
				
				public double paidAmount(String bookId) {
					BookingDetails booking = searchByBookId(bookId);
					System.out.println(booking.getPolicyID());
					System.out.println(booking.getBookingDate());
					Policy policyData = searchById(booking.getPolicyID());
					System.out.println(policyData.getPremiumAmount());
					System.out.println(policyData.getPayMode());
					String sql = "select sum(totalAmountToPayInEveryMode) from Payment where bookingId='" +bookId + "'";
					sessionFactory = SessionHelper.getConnection();
					Session session = sessionFactory.openSession();
					org.hibernate.Query query = session.createQuery(sql);
					List<Double> list = query.list();
					Double amountPaid = (Double)list.get(0);
					System.out.println(amountPaid);
					return amountPaid;
				}
	
	
}
