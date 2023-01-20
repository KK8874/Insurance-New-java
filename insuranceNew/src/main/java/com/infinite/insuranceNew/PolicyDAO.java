package com.infinite.insuranceNew;
import java.sql.SQLException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


@ManagedBean
@SessionScoped
public class PolicyDAO {

	SessionFactory sFactory;
	
	public String updatePolicy(Policy policy ){
        sFactory=SessionHelper.getConnection();
        Session session=sFactory.openSession();

        double pm= policy.getPremiumAmount();
        String payMode=policy.getPayMode();
        String term=policy.getTerm();
        double amount=amtPerMode(pm, payMode, term);
        double matureAmount=matureAmount(pm,term);

        policy.setMaturedAmount(matureAmount);
        policy.setInstallmentAmountPerPayMode(amount);

        Transaction transaction = session.beginTransaction();
        session.update(policy);
        transaction.commit();
        return "Policy Updated...";
       }

    public Policy searchById(String policyId) {
        sFactory = SessionHelper.getConnection();
          Session session = sFactory.openSession(); 
          Criteria cr = session.createCriteria(Policy.class);
          cr.add(Restrictions.eq("policyId", policyId));
          List<Policy> PolicyList = cr.list();
          return PolicyList.get(0);
    }
	
	public double matureAmount(double premiumAmount,String term) {
		sFactory = SessionHelper.getConnection();
        Session session = sFactory.openSession();
        double mAmt=0;
        double t=Double.parseDouble(term);
        mAmt=(premiumAmount*t)+((premiumAmount*t)*0.3);
        return mAmt;
	}
	public double amtPerMode(double premiumAmount,String payMode,String term ) {
		sFactory = SessionHelper.getConnection();
        Session session = sFactory.openSession();
       double amount = 0;
        if(payMode.equalsIgnoreCase("Quarterly")) {
        	amount+=premiumAmount/8;
        }
        if(payMode.equalsIgnoreCase("HalfYearly")) {
        	amount+=premiumAmount/4;
        }
        if(payMode.equalsIgnoreCase("Yearly")) {
        	amount+=premiumAmount/2;
        }
		return amount;
        
	}
    public String GenerateCustomerid() {    
        sFactory = SessionHelper.getConnection();
        Session session = sFactory.openSession();
        Criteria pl = session.createCriteria(Policy.class);
        List<Policy> policyList = pl.list();
        session.close();
        if( policyList.size()==0) {
            return "P001";
    
        }
        else {
            String id = policyList.get(policyList.size()-1).getPolicyId();
            int id1 = Integer.parseInt(id.substring(1));
            id1++;
            String id2 = String.format("P%03d", id1);
             return id2;        
        }    
    }
    
    public String addPolicy(Policy policy) {
        sFactory = SessionHelper.getConnection();
        Session session = sFactory.openSession();
        String policyid = GenerateCustomerid();
        policy.setPolicyId(policyid);
       double pm= policy.getPremiumAmount();
       String payMode=policy.getPayMode();
       String term=policy.getTerm();
       double amount=amtPerMode(pm, payMode, term);
       double matureAmount=matureAmount(pm,term);
       policy.setMaturedAmount(matureAmount);
       policy.setInstallmentAmountPerPayMode(amount);
        Criteria cr = session.createCriteria(Policy.class);
        Transaction tran =  session.beginTransaction();
        session.save(policy);
        tran.commit();
        return "Policy Added...";
    }
    
    
	public List<Policy> showPolicy(){
		
		Session session;
		sFactory=SessionHelper.getConnection();
		session=sFactory.openSession();
		Criteria cr=session.createCriteria(Policy.class);
		
		List<Policy> policyList=cr.list();
		
			return policyList;
		}	
	
	
	   public String deletePolicy(String policyId){
		   sFactory=SessionHelper.getConnection();
			Session session=sFactory.openSession();
		Policy policy = searchById(policyId);
			Transaction tr=session.beginTransaction();
			session.delete(policy);
			tr.commit();
			return "Policy Deleted";
			
	   }
}