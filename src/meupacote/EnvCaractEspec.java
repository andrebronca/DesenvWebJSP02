package meupacote;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	
@WebServlet("/ece")
public class EnvCaractEspec extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init() throws ServletException {
		super.init();
	}

	public void destroy() {
		super.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qs = URLEncoder.encode("Cidadão&João","ISO-8859-1");
		String qs2 = URLEncoder.encode("Cidadão&João","UTF-8");
		String html = "<html><head><title>Enviando caracteres especiais</title></head><body>"+
				"<a href=\"rce?dados="+ qs +"\">Clique aqui para enviar ISO-8859-1</a><br />"+
				"<a href=\"rce?dados="+ qs2 +"\">Clique aqui para enviar UTF-8</a><br />"+
				"</body></html>";
	
		response.setContentType("text/hmtl");
		PrintWriter writer = response.getWriter();
		writer.print(html);
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
