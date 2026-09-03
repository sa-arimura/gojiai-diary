package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MedicineDAO;
import model.Medicine;

@WebServlet("/MedicineRegisterServlet")
public class MedicineRegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String diseaseName = request.getParameter("diseaseName");
		String medicineName = request.getParameter("medicineName");
		String dosage = request.getParameter("dosage");
		String timing = request.getParameter("timing");
		String frequency = request.getParameter("frequency");
		String dayOfWeek = request.getParameter("dayOfWeek");
		String medicineType = request.getParameter("medicineType");
		String memo = request.getParameter("memo");

		if (timing == null || timing.isEmpty()) {
			request.setAttribute("errorMessage", "使用タイミングを選択してください");
			request.setAttribute("diseaseName", diseaseName);
			request.setAttribute("medicineName", medicineName);
			request.setAttribute("dosage", dosage);
			request.setAttribute("timing", timing);
			request.setAttribute("frequency", frequency);
			request.setAttribute("dayOfWeek", dayOfWeek);
			request.setAttribute("medicineType", medicineType);
			request.setAttribute("memo", memo);
			request.getRequestDispatcher("/medicineForm.jsp").forward(request, response);
			return;
		}

		Medicine medicine = new Medicine(
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
		dao.insert(medicine);

		response.sendRedirect("/gojiai-diary/medicineForm.jsp");
	}
}