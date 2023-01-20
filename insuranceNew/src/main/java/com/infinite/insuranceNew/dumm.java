package com.infinite.insuranceNew;

import java.sql.SQLException;

public class dumm {
  public static void main(String[] args)  {
	InsuranceDAO dao=new InsuranceDAO();
	try {
		System.out.println(dao.searchPaymentBookId1("B001"));
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
