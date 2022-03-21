package meupacote;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatandoDatas {
	private DateFormat dateFormat;
	private Date data;
	
	public FormatandoDatas() {
		dateFormat = DateFormat.getDateInstance();
		setData(new Date());
	}

	public String getData() {
		return dateFormat.format(data);
	}

	public void setData(Date data) {
		this.data = data;
	}
	
	public void setFormat(String formato) {
		this.dateFormat = new SimpleDateFormat(formato);
	}
	
	public void setDateFormat(String formato) {
		setFormat(formato);
	}
}
