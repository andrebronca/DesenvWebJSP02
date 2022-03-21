package meupacote;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vto")
public class VarrendoTodosObjetos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		super.init();
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Enumeration<String> e = request.getParameterNames();
		String html = "<html><head><title>Trabalhando com getParameterNames()</title></head><body>"
				+ "<h2>Dados cadastrados:</h2>";
		while (e.hasMoreElements()) {
			String param = e.nextElement();
			if (!param.contains("btn_")) {
				html += "<strong>" + param + ": </strong>" + request.getParameter(param) + "<br />";
			}
		}
		html += "</body></html>";

		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.println(html);
		writer.close();
	}

}
