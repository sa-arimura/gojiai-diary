package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String gender = request.getParameter("gender");
		String disease = request.getParameter("disease");
		String medicine = request.getParameter("medicine");

		User user = new User(name, birthDate, gender, disease, medicine);

		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/top.jsp");
		dispatcher.forward(request, response);
	}
}