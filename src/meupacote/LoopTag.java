package meupacote;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class LoopTag extends BodyTagSupport {
	private static final long serialVersionUID = 1548500153957199912L;
	private int contar;
	
	public void setContar(String cont) {
		try {
			contar = Integer.valueOf(cont);
		} catch (NumberFormatException e) {
			contar = 1;
		}
	}
	
	@Override
	public int doAfterBody() throws JspException {
		if (contar-- >= 1) { //decrementar senão ocorre loop infinito
			BodyContent bodyC = getBodyContent();
			try {
				JspWriter out = bodyC.getEnclosingWriter();
				out.println(bodyC.getString());
				bodyC.clearBody();
			} catch (IOException e) {
				System.out.println("Erro: "+ e.getMessage());
			}
			return EVAL_BODY_AGAIN;
		} else {
			return SKIP_BODY;
		}
	}
}
