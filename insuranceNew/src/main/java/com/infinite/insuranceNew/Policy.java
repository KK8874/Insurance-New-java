package com.infinite.insuranceNew;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@ManagedBean
@SessionScoped
@Entity
@Table(name="PolicyDetails")


public class Policy {
	@Id
	@Column(name = "PolicyId")
	private String policyId;
	
	@Column(name = "PolicyName")
	private String policyName;
	
	@Column(name = "PolicyType")
	private String policyType;
	
	@Column(name = "PremiumAmount")
	private Double premiumAmount;
	
	@Column(name = "PayMode")
	private String payMode;
	
	@Column(name = "Term")
	private String term;
	
	@Column(name = "InstallmentAmountPerPayMode")
	private Double installmentAmountPerPayMode;
	
	@Column(name = "MaturedAmount")
	private Double maturedAmount;

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getPolicyName() {
		return policyName;
	}

	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}

	public String getPolicyType() {
		return policyType;
	}

	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}

	public Double getPremiumAmount() {
		return premiumAmount;
	}

	public void setPremiumAmount(Double premiumAmount) {
		this.premiumAmount = premiumAmount;
	}

	public String getPayMode() {
		return payMode;
	}

	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public Double getInstallmentAmountPerPayMode() {
		return installmentAmountPerPayMode;
	}

	public void setInstallmentAmountPerPayMode(Double installmentAmountPerPayMode) {
		this.installmentAmountPerPayMode = installmentAmountPerPayMode;
	}

	public Double getMaturedAmount() {
		return maturedAmount;
	}

	public void setMaturedAmount(Double maturedAmount) {
		this.maturedAmount = maturedAmount;
	}

	@Override
	public String toString() {
		return "Policy [policyId=" + policyId + ", policyName=" + policyName + ", policyType=" + policyType
				+ ", premiumAmount=" + premiumAmount + ", payMode=" + payMode + ", term=" + term
				+ ", installmentAmountPerPayMode=" + installmentAmountPerPayMode + ", maturedAmount=" + maturedAmount
				+ "]";
	}

	
}