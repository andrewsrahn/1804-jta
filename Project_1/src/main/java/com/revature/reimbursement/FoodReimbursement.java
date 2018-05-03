package com.revature.reimbursement;

import java.sql.Date;

import com.revature.factory.Reimbursement;

public class FoodReimbursement implements Reimbursement {

	int requestor_id;
	int approver_id;
	float amount;
	Date requestDate;
	Date approveDate;
	
	public FoodReimbursement() {}
	
	public FoodReimbursement(int requestor_id, int approver_id, int category, float amount, Date requestDate,
			Date approveDate) {
		super();
		this.requestor_id = requestor_id;
		this.approver_id = approver_id;
		this.amount = amount;
		this.requestDate = requestDate;
		this.approveDate = approveDate;
	}
	
	public int getRequestor_id() {
		return requestor_id;
	}
	public void setRequestor_id(int requestor_id) {
		this.requestor_id = requestor_id;
	}
	public int getApprover_id() {
		return approver_id;
	}
	public void setApprover_id(int approver_id) {
		this.approver_id = approver_id;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public Date getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Float.floatToIntBits(amount);
		result = prime * result + ((approveDate == null) ? 0 : approveDate.hashCode());
		result = prime * result + approver_id;
		result = prime * result + ((requestDate == null) ? 0 : requestDate.hashCode());
		result = prime * result + requestor_id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FoodReimbursement other = (FoodReimbursement) obj;
		if (Float.floatToIntBits(amount) != Float.floatToIntBits(other.amount))
			return false;
		if (approveDate == null) {
			if (other.approveDate != null)
				return false;
		} else if (!approveDate.equals(other.approveDate))
			return false;
		if (approver_id != other.approver_id)
			return false;
		if (requestDate == null) {
			if (other.requestDate != null)
				return false;
		} else if (!requestDate.equals(other.requestDate))
			return false;
		if (requestor_id != other.requestor_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FoodReimbursement [requestor_id=" + requestor_id + ", approver_id=" + approver_id + ", amount=" + amount
				+ ", requestDate=" + requestDate + ", approveDate=" + approveDate + "]";
	}
	
	
}
