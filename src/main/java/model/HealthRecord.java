package model;

import java.io.Serializable;

public class HealthRecord implements Serializable {
	private String recordDate;
	private double weight;
	private double temperature;
	private int systolic;
	private int diastolic;
	private String migraine;
	private String period;
	private String condition;
	private String memo;
	private String medicineStatus;

	public HealthRecord() {
	}

	public HealthRecord(String recordDate, double weight, double temperature, int systolic, int diastolic,
			String migraine, String period, String condition, String memo, String medicineStatus) {
		this.recordDate = recordDate;
		this.weight = weight;
		this.temperature = temperature;
		this.systolic = systolic;
		this.diastolic = diastolic;
		this.migraine = migraine;
		this.period = period;
		this.condition = condition;
		this.memo = memo;
		this.medicineStatus = medicineStatus;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}

	public int getSystolic() {
		return systolic;
	}

	public void setSystolic(int systolic) {
		this.systolic = systolic;
	}

	public int getDiastolic() {
		return diastolic;
	}

	public void setDiastolic(int diastolic) {
		this.diastolic = diastolic;
	}

	public String getMigraine() {
		return migraine;
	}

	public void setMigraine(String migraine) {
		this.migraine = migraine;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getMedicineStatus() {
		return medicineStatus;
	}

	public void setMedicineStatus(String medicineStatus) {
		this.medicineStatus = medicineStatus;
	}
}