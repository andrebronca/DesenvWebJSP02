package meupacote;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class IfElseTag extends BodyTagSupport{

	private static final long serialVersionUID = 9082962874554981468L;
	
	@Override
	public int doStartTag() throws JspException {
		IfTag ifTag = (IfTag) findAncestorWithClass(this, IfTag.class);
		if (ifTag == null) {
			throw new JspTagException("não contém uma condição em if");
		} else if (!ifTag.temCondicao()) {
			throw new JspTagException("a condição deve vir antes dessa tag");
		}
		return EVAL_BODY_AGAIN;
	}
	
	@Override
	public int doAfterBody() throws JspException {
		IfTag ifTag = (IfTag) findAncestorWithClass(this, IfTag.class);
		if (!ifTag.getCondicao()) {
			try {
				BodyContent body = getBodyContent();
				JspWriter out = body.getEnclosingWriter();
				out.print(body.getString());
			} catch (IOException e) {
				System.out.println("Erro: "+ e.getMessage());
			}
		}
		return SKIP_BODY;
	}
}
