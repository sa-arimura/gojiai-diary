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

import dao.MedicineDAO;
import model.Medicine;

@WebServlet("/UpdateMedicineServlet")
public class UpdateMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String idStr = request.getParameter("id");
		String diseaseName = request.getParameter("diseaseName");
		String medicineName = request.getParameter("medicineName");
		String dosage = request.getParameter("dosage");
		String medicineType = request.getParameter("medicineType");
		String frequency = request.getParameter("frequency");
		String dayOfWeek = request.getParameter("dayOfWeek");
		String timing = request.getParameter("timing");
		String memo = request.getParameter("memo");

		List<String> errorMessages = new ArrayList<>();

		if (medicineName == null || medicineName.trim().isEmpty()) {
			errorMessages.add("・薬名を入力してください。");
		}

		if (timing == null || timing.trim().isEmpty()) {
			errorMessages.add("・使用タイミングを選択してください。");
		}

		if ("毎週".equals(frequency) && (dayOfWeek == null || dayOfWeek.trim().isEmpty())) {
			errorMessages.add("・頻度が「毎週」の場合は曜日を選択してください。");
		}

		int id = Integer.parseInt(idStr);

		if (!errorMessages.isEmpty()) {
			String errorMessage = String.join("<br>", errorMessages);

			request.setAttribute("errorMessage", errorMessage);

			Medicine editMedicine = new Medicine(
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

			request.setAttribute("editMedicine", editMedicine);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/medicineForm.jsp");
			dispatcher.forward(request, response);
			return;
		}

		Medicine updatedMedicine = new Medicine(
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

		MedicineDAO dao = new MedicineDAO();
		dao.update(updatedMedicine);

		response.sendRedirect("/gojiai-diary/medicineForm.jsp");
	}
}