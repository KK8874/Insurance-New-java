package com.infinite.insuranceNew;

import java.sql.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@ManagedBean(name="payment")
@SessionScoped

@Entity
@Table(name="paymentdetails")
public class Payment {
	@Id
	@Column(name="PaymentntId")
	private String paymentntId ;
	
	@Column(name="BookingId")
	 private String bookingId ;
	
	@Column(name="CustomerId")
	 private String customerId ;
	
	@Column(name="PolicyId")
	 private String policyId ;
	
	
	@Column(name="TotalAmountToPayInEveryMode")
	 private double totalAmountToPayInEveryMode ;
	
	
	@Column(name="PaymentDate")
	 private Date paymentDate;
	
	@Column(name="NextDayPayment")
	 private Date nextDayPayment;
	
	@Column(name="PolicyName")
	private String policyName;

	public String getPaymentntId() {
		return paymentntId;
	}

	public void setPaymentntId(String paymentntId) {
		this.paymentntId = paymentntId;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public double getTotalAmountToPayInEveryMode() {
		return totalAmountToPayInEveryMode;
	}

	public void setTotalAmountToPayInEveryMode(double totalAmountToPayInEveryMode) {
		this.totalAmountToPayInEveryMode = totalAmountToPayInEveryMode;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getNextDayPayment() {
		return nextDayPayment;
	}

	public void setNextDayPayment(Date nextDayPayment) {
		this.nextDayPayment = nextDayPayment;
	}

	public String getPolicyName() {
		return policyName;
	}

	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}

	
	
	
	
	
}