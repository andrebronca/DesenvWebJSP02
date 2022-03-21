package meupacote;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

public class DesenvolvendoTaglibs extends TagSupport {

	private static final long serialVersionUID = -3818236275208642437L;

	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().print("Desenvolvendo com taglib.java");
		} catch (IOException e) {
			throw new JspTagException("Erro: IOException: " + e.getMessage());
		}
		return SKIP_BODY;
	}

}
