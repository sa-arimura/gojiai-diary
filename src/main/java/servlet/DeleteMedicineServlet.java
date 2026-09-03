package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MedicineDAO;

@WebServlet("/DeleteMedicineServlet")
public class DeleteMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String idStr = request.getParameter("id");

		if (idStr != null && !idStr.isEmpty()) {
			int id = Integer.parseInt(idStr);

			MedicineDAO dao = new MedicineDAO();
			dao.delete(id);
		}

		response.sendRedirect("/gojiai-diary/medicineForm.jsp");
	}
}