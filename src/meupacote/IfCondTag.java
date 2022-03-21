package meupacote;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class IfCondTag extends BodyTagSupport {
	private static final long serialVersionUID = 6154477580686349623L;

	@Override
	public int doStartTag() throws JspException {
		IfTag ifTag = (IfTag) findAncestorWithClass(this, IfTag.class);
		if (ifTag == null) {
			throw new JspTagException("não contém uma condição em if");
		}
		return EVAL_BODY_AGAIN;
	}
	
	@Override
	public int doAfterBody() throws JspException {
		IfTag ifTag = (IfTag) findAncestorWithClass(this, IfTag.class);
		String bodyString = getBodyContent().getString();
		if (bodyString.trim().equals("true")) {
			ifTag.setCondicao(true);
		} else {
			ifTag.setCondicao(false);
		}
		return SKIP_BODY;
	}

}
