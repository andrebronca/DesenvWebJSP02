package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tomcs")
public class TrabOutrosMetComServlet extends HttpServlet {
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
		String[] musicas = request.getParameterValues("musica"); // checkbox
		String html = "<html><head><title>Trabalhando com outros métodos em Servlet</title></head><body>"
				+ "<h2>Músicas escolhidas:</h2>";
		for (String musica : musicas) {
			html += "<strong>" + musica + "</strong><br />";
		}
		html += "</body></html>";
		
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.print(html);
		writer.close();
	}

}
