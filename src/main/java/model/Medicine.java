package model;

import java.io.Serializable;

public class Medicine implements Serializable {
	private int id;
	private String diseaseName;
	private String medicineName;
	private String dosage;
	private String timing;
	private String frequency;
	private String dayOfWeek;
	private String medicineType;
	private String memo;

	public Medicine() {
	}

	public Medicine(String diseaseName, String medicineName, String dosage,
			String timing, String frequency, String dayOfWeek,
			String medicineType, String memo) {
		this.diseaseName = diseaseName;
		this.medicineName = medicineName;
		this.dosage = dosage;
		this.timing = timing;
		this.frequency = frequency;
		this.dayOfWeek = dayOfWeek;
		this.medicineType = medicineType;
		this.memo = memo;
	}

	public Medicine(int id, String diseaseName, String medicineName, String dosage,
			String timing, String frequency, String dayOfWeek,
			String medicineType, String memo) {
		this.id = id;
		this.diseaseName = diseaseName;
		this.medicineName = medicineName;
		this.dosage = dosage;
		this.timing = timing;
		this.frequency = frequency;
		this.dayOfWeek = dayOfWeek;
		this.medicineType = medicineType;
		this.memo = memo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDiseaseName() {
		return diseaseName;
	}

	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}

	public String getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}

	public String getDosage() {
		return dosage;
	}

	public void setDosage(String dosage) {
		this.dosage = dosage;
	}

	public String getTiming() {
		return timing;
	}

	public void setTiming(String timing) {
		this.timing = timing;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public String getMedicineType() {
		return medicineType;
	}

	public void setMedicineType(String medicineType) {
		this.medicineType = medicineType;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
}