package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rce")
public class RecCaractEspec extends HttpServlet {
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
		String dados = request.getParameter("dados");
		String html = "<html><head><title>Recebendo caracteres especiais</title></head><body>"+
				"os dados recebidos são: <strong>"+ dados +"</strong><br />"+
				"A query string recebida é: <strong>"+ request.getQueryString() +"</strong>"+
				"</body></html>";
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.print(html);
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
