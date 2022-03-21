package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CriandoCookie
 */
@WebServlet("/cck")
public class CriandoCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CriandoCookie() {
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    }
    
    @Override
    public void destroy() {
    	// TODO Auto-generated method stub
    	super.destroy();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie meucookie = new Cookie("nome","Andre");
		meucookie.setMaxAge(60);	//tempo em segundos para expirar o cookie
		meucookie.setSecure(false);	//se deve ser transferido pelo protocolo http padrão
		meucookie.setComment("Meu nome");
		response.addCookie(meucookie);	//grava o cookie no computador
		
		String hmtl = "<html><head><title>Criando um Cookie</title></head><body>"+
				"<h2>Cookie criado com sucesso!</h2>"+
				"<a href=\"vck\">Clique aqui para ver o cookie criado</a>"+
				"</body></html>";
		response.setContentType("text/hmtl");
		PrintWriter writer = response.getWriter();
		writer.println(hmtl);
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
