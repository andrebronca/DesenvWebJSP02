package meupacote;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SimpleTagDinamica extends SimpleTagSupport{
	private String nome = "";
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().write(nome);
	}

}
