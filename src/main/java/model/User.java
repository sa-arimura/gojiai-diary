package model;

import java.io.Serializable;

public class User implements Serializable {
	private String name;
	private String birthDate;
	private String gender;
	private String disease;
	private String medicine;

	public User() {
	}

	public User(String name, String birthDate, String gender, String disease, String medicine) {
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.disease = disease;
		this.medicine = medicine;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
}