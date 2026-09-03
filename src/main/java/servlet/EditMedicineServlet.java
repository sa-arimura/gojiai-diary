package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MedicineDAO;
import model.Medicine;

@WebServlet("/EditMedicineServlet")
public class EditMedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// ★ idを受け取る
		String idStr = request.getParameter("id");

		if (idStr != null) {
			int id = Integer.parseInt(idStr);

			// ★ DBから1件取得
			MedicineDAO dao = new MedicineDAO();
			Medicine editMedicine = dao.findById(id);

			// ★ JSPに渡す
			request.setAttribute("editMedicine", editMedicine);
		}

		// ★ 同じ画面に戻す（編集モード）
		RequestDispatcher dispatcher = request.getRequestDispatcher("/medicineForm.jsp");
		dispatcher.forward(request, response);
	}
}