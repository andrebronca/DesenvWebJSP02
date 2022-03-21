package meupacote;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class InputTag extends TagSupport {
	private static final long serialVersionUID = 3675206398037135881L;
	
	private String type = null;
	private String name = null;
	private String id = null;
	private String value = null;
	private String size = null;
	private String maxLength = null;
	
	@Override
	public int doStartTag() throws JspException {
		return SKIP_BODY;	//indica que a tag não tem um corpo: <input ... />
	}
	
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print("<input");
			out.print(" type=\""+ getType() +"\"");
			out.print(" name=\""+ getName() +"\"");
			if (getValue() != null) out.print(" value=\""+ getValue() +"\"");
			if (getId() != null) out.print(" id=\""+ getId() +"\"");
			if (getSize() != null) out.print(" size=\""+ getSize() +"\"");
			if (getMaxLength() != null) out.print(" maxlength=\""+ getMaxLength() +"\"");
			out.print(" />");
			
		} catch (IOException e) {
			System.out.println("Erro: "+ e.getMessage());
		}
		this.release();
		return EVAL_PAGE;
	}
	
	@Override
	public void release() {
		super.release();
		type = null;
		name = null;
		id = null;
		value = null;
		size = null;
		maxLength = null;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMaxLength() {
		return maxLength;
	}

	public void setMaxLength(String maxLength) {
		this.maxLength = maxLength;
	}
	
	

}
