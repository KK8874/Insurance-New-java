package com.infinite.insuranceNew;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@ManagedBean(name="lapsed")
@SessionScoped
@Entity
@Table(name="LapsedPolicies")
public class LapsedPolicy {

	@Id
	@Column(name="LapsedId")
	private String lapsedId;
	
	@Column(name="BookingID")
	private String bookingId;
	
	@Column(name="lapsedStatus")
	private String lapsedStatus;
	
	@Column(name="RefundAmount")
	private double refundAmount;

	@Column(name="CustomerId")
	private String customerId;

	public String getLapsedId() {
		return lapsedId;
	}

	public void setLapsedId(String lapsedId) {
		this.lapsedId = lapsedId;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public String getLapsedStatus() {
		return lapsedStatus;
	}

	public void setLapsedStatus(String lapsedStatus) {
		this.lapsedStatus = lapsedStatus;
	}

	public double getRefundAmount() {
		return refundAmount;
	}

	public void setRefundAmount(double refundAmount) {
		this.refundAmount = refundAmount;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}


	
	
}
