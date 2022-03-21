package meupacote;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class IfTag extends TagSupport {
	private static final long serialVersionUID = -5757774403260991751L;
	private boolean condicao;
	private boolean temCondicao = false;

	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_INCLUDE;
	}

	public void setCondicao(boolean condicao) {
		this.condicao = condicao;
		temCondicao = true;
	}

	public boolean getCondicao() {
		return condicao;
	}

	public void setTemCondicao(boolean temCondicao) {
		this.temCondicao = temCondicao;
	}

	public boolean temCondicao() {
		return temCondicao;
	}

}
