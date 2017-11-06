package cmo.entities;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

/**
 * To EF
 * 
 * @author HawksSeptua
 *
 */
@Entity
public class EFOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long efOrderID;
	private long crisisID;
	private String name;
	private String positionInCMO;
	private int threatLevel;
	private String crisisType;
	private String affectedArea;
	private String crisisDetails;
	private String couseofAction;
	@CreationTimestamp
	private Timestamp receivedMessageTime;
	private boolean read = false;

	public EFOrder() {
		crisisID = 0;
	}

	public EFOrder(long efOrderID, long crisisID, String name, String positionInCMO, int threatLevel, String crisisType,
			String affectedArea, String crisisDetails, String couseofAction, Timestamp receivedMessageTime,
			boolean read) {
		this.efOrderID = efOrderID;
		this.crisisID = crisisID;
		this.name = name;
		this.positionInCMO = positionInCMO;
		this.threatLevel = threatLevel;
		this.crisisType = crisisType;
		this.affectedArea = affectedArea;
		this.crisisDetails = crisisDetails;
		this.couseofAction = couseofAction;
		this.receivedMessageTime = receivedMessageTime;
		this.read = read;
	}

	// for use by cmo.tony.CMOEFClient
	public EFOrder(long crisisID, String name, String positionInCMO, int threatLevel, String crisisType,
			String affectedArea, String crisisDetails, String couseofAction) {
		this.crisisID = crisisID;
		this.name = name;
		this.positionInCMO = positionInCMO;
		this.threatLevel = threatLevel;
		this.crisisType = crisisType;
		this.affectedArea = affectedArea;
		this.crisisDetails = crisisDetails;
		this.couseofAction = couseofAction;
	}

	public long getEfOrderID() {
		return efOrderID;
	}

	public long getCrisisID() {
		return crisisID;
	}

	public String getName() {
		return name;
	}

	public String getPositionInCMO() {
		return positionInCMO;
	}

	public int getThreatLevel() {
		return threatLevel;
	}

	public String getCrisisType() {
		return crisisType;
	}

	public String getAffectedArea() {
		return affectedArea;
	}

	public String getCrisisDetails() {
		return crisisDetails;
	}

	public String getCouseofAction() {
		return couseofAction;
	}

	public Timestamp getReceivedMessageTime() {
		return receivedMessageTime;
	}

	public boolean isRead() {
		return read;
	}

	public void setEfOrderID(long efOrderID) {
		this.efOrderID = efOrderID;
	}

	public void setCrisisID(long crisisID) {
		this.crisisID = crisisID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPositionInCMO(String positionInCMO) {
		this.positionInCMO = positionInCMO;
	}

	public void setThreatLevel(int threatLevel) {
		this.threatLevel = threatLevel;
	}

	public void setCrisisType(String crisisType) {
		this.crisisType = crisisType;
	}

	public void setAffectedArea(String affectedArea) {
		this.affectedArea = affectedArea;
	}

	public void setCrisisDetails(String crisisDetails) {
		this.crisisDetails = crisisDetails;
	}

	public void setCouseofAction(String couseofAction) {
		this.couseofAction = couseofAction;
	}

	public void setReceivedMessageTime(Timestamp receivedMessageTime) {
		this.receivedMessageTime = receivedMessageTime;
	}

	public void setRead(boolean read) {
		this.read = read;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (crisisID ^ (crisisID >>> 32));
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
		EFOrder other = (EFOrder) obj;
		if (crisisID != other.crisisID)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "EFOrder [efOrderID=" + efOrderID + ", crisisID=" + crisisID + ", name=" + name + ", positionInCMO="
				+ positionInCMO + ", threatLevel=" + threatLevel + ", crisisType=" + crisisType + ", affectedArea="
				+ affectedArea + ", crisisDetails=" + crisisDetails + ", couseofAction=" + couseofAction
				+ ", receivedMessageTime=" + receivedMessageTime + ", read=" + read + "]";
	}

}