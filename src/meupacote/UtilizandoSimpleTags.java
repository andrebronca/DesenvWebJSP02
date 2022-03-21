package meupacote;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class UtilizandoSimpleTags extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().write("Utilizando SimpleTags!");
	}
}
