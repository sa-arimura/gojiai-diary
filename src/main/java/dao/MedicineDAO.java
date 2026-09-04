package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Medicine;

public class MedicineDAO {

	private final String JDBC_URL = System.getenv("GOJIAI_DB_URL");
	private final String DB_USER = System.getenv("GOJIAI_DB_USER");
	private final String DB_PASS = System.getenv().getOrDefault("GOJIAI_DB_PASSWORD", "");

	public List<Medicine> findAll() {
		List<Medicine> medicineList = new ArrayList<>();

		try {
			Class.forName("org.h2.Driver");

			Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

			String sql = "SELECT ID, DISEASE_NAME, MEDICINE_NAME, DOSAGE, TIMING, FREQUENCY, DAY_OF_WEEK, MEDICINE_TYPE, MEMO FROM MEDICINES";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");
				String diseaseName = rs.getString("DISEASE_NAME");
				String medicineName = rs.getString("MEDICINE_NAME");
				String dosage = rs.getString("DOSAGE");
				String timing = rs.getString("TIMING");
				String frequency = rs.getString("FREQUENCY");
				String dayOfWeek = rs.getString("DAY_OF_WEEK");
				String medicineType = rs.getString("MEDICINE_TYPE");
				String memo = rs.getString("MEMO");

				Medicine medicine = new Medicine(
						id,
						diseaseName,
						medicineName,
						dosage,
						timing,
						frequency,
						dayOfWeek,
						medicineType,
						memo
				);

				medicineList.add(medicine);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return medicineList;
	}

	public boolean insert(Medicine medicine) {
		try {
			Class.forName("org.h2.Driver");

			Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

			String sql = "INSERT INTO MEDICINES(DISEASE_NAME, MEDICINE_NAME, DOSAGE, TIMING, FREQUENCY, DAY_OF_WEEK, MEDICINE_TYPE, MEMO) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, medicine.getDiseaseName());
			pStmt.setString(2, medicine.getMedicineName());
			pStmt.setString(3, medicine.getDosage());
			pStmt.setString(4, medicine.getTiming());
			pStmt.setString(5, medicine.getFrequency());
			pStmt.setString(6, medicine.getDayOfWeek());
			pStmt.setString(7, medicine.getMedicineType());
			pStmt.setString(8, medicine.getMemo());

			int result = pStmt.executeUpdate();

			conn.close();

			return result == 1;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean delete(int id) {
		try {
			Class.forName("org.h2.Driver");

			Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

			String sql = "DELETE FROM MEDICINES WHERE ID = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, id);

			int result = pStmt.executeUpdate();

			conn.close();

			return result == 1;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public Medicine findById(int id) {
	    Medicine medicine = null;

	    try {
	        Class.forName("org.h2.Driver");
	        java.sql.Connection conn = java.sql.DriverManager.getConnection(
	                JDBC_URL, DB_USER, DB_PASS);

	        String sql = "SELECT * FROM MEDICINES WHERE ID = ?";
	        java.sql.PreparedStatement pStmt = conn.prepareStatement(sql);
	        pStmt.setInt(1, id);

	        java.sql.ResultSet rs = pStmt.executeQuery();

	        if (rs.next()) {
	            medicine = new Medicine(
	                rs.getInt("ID"),
	                rs.getString("DISEASE_NAME"),
	                rs.getString("MEDICINE_NAME"),
	                rs.getString("DOSAGE"),
	                rs.getString("TIMING"),
	                rs.getString("FREQUENCY"),
	                rs.getString("DAY_OF_WEEK"),
	                rs.getString("MEDICINE_TYPE"),
	                rs.getString("MEMO")
	            );
	        }

	        conn.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return medicine;
	}
	public void update(Medicine medicine) {
	    try {
	        Class.forName("org.h2.Driver");
	        java.sql.Connection conn = java.sql.DriverManager.getConnection(
	                JDBC_URL, DB_USER, DB_PASS);

	        String sql = "UPDATE MEDICINES SET "
	                + "DISEASE_NAME=?, MEDICINE_NAME=?, DOSAGE=?, TIMING=?, "
	                + "FREQUENCY=?, DAY_OF_WEEK=?, MEDICINE_TYPE=?, MEMO=? "
	                + "WHERE ID=?";

	        java.sql.PreparedStatement pStmt = conn.prepareStatement(sql);

	        pStmt.setString(1, medicine.getDiseaseName());
	        pStmt.setString(2, medicine.getMedicineName());
	        pStmt.setString(3, medicine.getDosage());
	        pStmt.setString(4, medicine.getTiming());
	        pStmt.setString(5, medicine.getFrequency());
	        pStmt.setString(6, medicine.getDayOfWeek());
	        pStmt.setString(7, medicine.getMedicineType());
	        pStmt.setString(8, medicine.getMemo());
	        pStmt.setInt(9, medicine.getId());

	        pStmt.executeUpdate();
	        conn.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
