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
 * Servlet implementation class VisualizaCookie
 */
@WebServlet("/vck")
public class VisualizaCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VisualizaCookie() {
        // TODO Auto-generated constructor stub
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
		Cookie listacookies[] = request.getCookies();
		Cookie nome = null;
		
		if(listacookies != null) {
			for(int i = 0; i < listacookies.length; i++) {
				if(listacookies[i].getName().equals("nome")) {
					nome = listacookies[i];
					break;
				}
			}
		}
		
		String html = "<html><head><title>Visualizando um Cookie</title><body>"+
				"O cookie chamado <strong>nome</strong> tem o valor: <strong>"+ nome.getValue() +"</strong>"+
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
