package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.HealthRecord;
import model.Medicine;

@WebServlet("/HealthRecordServlet")
public class HealthRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String recordDate = request.getParameter("recordDate");
		double weight = Double.parseDouble(request.getParameter("weight"));
		double temperature = Double.parseDouble(request.getParameter("temperature"));
		int systolic = Integer.parseInt(request.getParameter("systolic"));
		int diastolic = Integer.parseInt(request.getParameter("diastolic"));
		String migraine = request.getParameter("migraine");
		String period = request.getParameter("period");
		String condition = request.getParameter("condition");
		String memo = request.getParameter("memo");

		HttpSession session = request.getSession();

		List<Medicine> medicineList = (List<Medicine>) session.getAttribute("medicineList");
		String medicineStatus = "";

		if (medicineList != null && !medicineList.isEmpty()) {
			StringBuilder sb = new StringBuilder();

			for (Medicine m : medicineList) {
				String status = request.getParameter("medicine_" + m.getMedicineName());

				if (status != null) {
					sb.append(m.getMedicineName())
					  .append("：")
					  .append(status)
					  .append(" ");
				}
			}

			medicineStatus = sb.toString();
		}

		HealthRecord record = new HealthRecord(recordDate, weight, temperature, systolic, diastolic,
				migraine, period, condition, memo, medicineStatus);

		List<HealthRecord> recordList = (List<HealthRecord>) session.getAttribute("recordList");

		if (recordList == null) {
			recordList = new ArrayList<>();
		}

		recordList.add(record);

		session.setAttribute("recordList", recordList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/healthList.jsp");
		dispatcher.forward(request, response);
	}
}