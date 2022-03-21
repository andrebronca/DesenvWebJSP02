package meupacote;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletSessionPagUm
 */
@WebServlet("/sspu")
public class ServletSessionPagUm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletSessionPagUm() {
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
		sessao.setAttribute("nome", "andre");
		sessao.setMaxInactiveInterval(10);	//10 segundos de validade
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss");
		
		String html = "<html><head><title>Trabalhando com Sessão</title></head><body>"+
				"Sessão criada com sucesso!<br />"+
				"Sua ID é: <strong>"+ sessao.getId() +"</strong><br />"+
				"O tempo máximo de inatividade é: <strong>"+ sessao.getMaxInactiveInterval() +"</strong> segundo(s)<br />"+
				"Sessão criada em: <strong>"+ sdf.format(new Date(sessao.getCreationTime())) +"</strong><br />"+
				"Último acesso em: <strong>"+ sdf.format(new Date(sessao.getLastAccessedTime())) +"</strong><br />"+
				"<a href=\"sspd\">Clique aqui</a> para ver a sessão na página seguinte."+
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
