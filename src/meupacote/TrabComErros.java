package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tce")
public class TrabComErros extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrabComErros() {
        super();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    }
    
    @Override
    public void destroy() {
    	super.destroy();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String v1 = request.getParameter("val1");
		String v2 = request.getParameter("val2");
		int val1 = 0;
		int val2 = 0;
		float res = 0;
		
		if (v1 != null) {
			val1 = Integer.getInteger(v1);
		}
		if (v2 != null) {
			val2 = Integer.getInteger(v2);
		}
		res = (val2 != 0)? (val1 / val2) : 0;
		
		//estava causando erro: java.lang.NumberFormatException: null
//		int val1 = Integer.parseInt(request.getParameter("val1"));
//		int val2 = Integer.parseInt(request.getParameter("val2"));
//		float resultado = val1 / val2;
		
		String html = "<html><head><title>Tratando Erros</title></head><body>"+
				"O resultado é: <strong>"+ res +"</strong><br />"+
				"A query string enviada é: <strong>"+ request.getQueryString() +"</strong><br />"+
				"<form action=\"tce\" method=\"get\">"+
				"Valor 1: <input type=\"text\" name=\"val1\" /><br />"+
				"Valor 2: <input type=\"text\" name=\"val2\" /><br />"+
				"<input type=\"submit\" value=\"Enviar\" name=\"btn_enviar\" />"+
				"</body></html>";
		
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.print(html);
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
