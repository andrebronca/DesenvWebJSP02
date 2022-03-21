package meupacote;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rc")
public class RecCabecalhos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		super.init();
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/hmtl;charset=ISO-8859-1");
		String html = "<html><head><title>Trabalhando com Servlet</title></head><body>";
		Enumeration<String> e = request.getHeaderNames();
		while(e.hasMoreElements()) {
			String cabecalho = e.nextElement();
			html += "<strong>"+ cabecalho +": </strong>"+ request.getHeader(cabecalho) +"<br />";
		}
		html += "</body></html>";
		PrintWriter writer = response.getWriter();
		writer.println(html);
		writer.close();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
