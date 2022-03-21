package meupacote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletSessionPagDois
 */
@WebServlet("/sspd")
public class ServletSessionPagDois extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletSessionPagDois() {
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
		HttpSession sessao = request.getSession(true);
		String nome = (String) sessao.getAttribute("nome");
		
		String html = "<html><head><title>Trabalhando com Sessão</title></head><body>";
		if(nome != null) {
			html += "Sua Id é: <strong>"+ sessao.getId() +"</strong><br />E seu nome é: <strong>"+ nome +"</strong><br />";
		} else {
			html += "Sua sessão não foi criada.<br />"+
					"<a href=\"sspu\">Clique aqui</a> para criar sua sessão.<br />";
		}
		html += "<a href=\"sfs\">Clique aqui</a> para fechar a sessão.<br />"+
				"</body></html>";
		
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.println(html);
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
