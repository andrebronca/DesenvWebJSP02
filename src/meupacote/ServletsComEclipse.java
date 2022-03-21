package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sce")
public class ServletsComEclipse extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletsComEclipse() {
    }

	public void init(ServletConfig config) throws ServletException {
		super.init();
	}

	public void destroy() {
		super.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		String html = "<html><head><title>Trabalhando com Post em Servlet</title></head><body>";
		if(usuario.equals("admin") && senha.equals("admin")) {
			html += "Senha bem vindo "+ usuario;
		} else {
			html += "Usuário ou senha inválidos!";
		}
		
		html += "</body></html>";
		response.setContentType("text/html");
		
		PrintWriter writer = response.getWriter();
		writer.print(html);
		writer.close();
		
//		doGet(request, response);
	}

}
