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
 * Servlet implementation class ServletFecharSessao
 */
@WebServlet("/sfs")
public class ServletFecharSessao extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletFecharSessao() {
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
//		sessao.removeAttribute("nome");
		String nome = null; 
//		nome = (String) sessao.getAttribute("nome");
		/*
		 * Para destruir uma sessão comente as duas linhas conforme exemplo abaixo
		 * sessao.removeAttribute("nome");
		 * String nome = (String) sessao.getAttribute("nome");
		 * ative a linha:
		 * sessao.invalidate();
		 * isso fará o objeto de sessão ser destruído.
		 */
		sessao.invalidate();
		
		String html = "<html><head><title>Terminando uma sessão</title></head><body>"+
				"Sua id é: <strong>"+ sessao.getId() +"</strong><br />"+
				"E seu nome é: <strong>"+ nome +"</strong><br />"+
				"<a href=\"sspu\">Clique aqui</a> para iniciar uma nova sessão."+
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
