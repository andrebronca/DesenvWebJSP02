package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tcgs")
public class TrabComGetServlet extends HttpServlet {

	private static final long serialVersionUID = 3166835826045971336L;

	@Override
	public void destroy() {
		super.destroy();
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String curso = req.getParameter("curso");
		String id = req.getParameter("id");
		String html = "<html><head><title>Trabalhando com GET em Servlet</title></head><body>"+
				"Nome: <strong>"+ nome +"</strong><br />"+
				"Id: <strong>"+ id +"</strong><br />"+
				"Curso: <strong>"+ curso +"</strong><br />"+
				"A query string enviada é: <strong>"+
				req.getQueryString() +"</strong>"+
				"</body></html>";
		resp.setContentType("text/html");
		PrintWriter writer = resp.getWriter();
		writer.print(html);
		writer.close();
	}
}
