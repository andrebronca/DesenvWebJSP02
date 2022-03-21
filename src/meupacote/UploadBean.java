package meupacote;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadBean {
	private DiskFileItemFactory fileUpload = new DiskFileItemFactory();
	private ServletFileUpload sfu = new ServletFileUpload(fileUpload);
	private String diretorio;
	private String filename;
	private static int KB = 1024;
	private static int MB = 1024 * 1024;
	private int size;
	private String extensoesPermitidas;
	private String erro = null;

	public void setDiretorio(String diretorio) {
		this.diretorio = diretorio;
	}

	public String getDiretorio() {
		return diretorio;
	}

	public String getFilename() {
		return filename;
	}

	@SuppressWarnings("rawtypes")
	public boolean doFilePost(HttpServletRequest request, ServletContext context) {
		System.out.println("UploadBean: "+ request.getContentType());
		
		if(request.getContentType() == null) {
			return false;
		}
		
		if (!request.getContentType().startsWith("multipart/form-data")) {
			return false;
		}
		
		fileUpload.setSizeThreshold(4 * KB);
		
		String path = context.getRealPath(getDiretorio());	
		path = "D:\\temp\\upload";	//mudei pq o de cima envia pra diretório temporário e ocorre erro.
		/*	
		 * Define o path onde será feito o upload, e quando o usuário adiciona o arquivo, será enviado para o local
		 */
				
		System.out.println("path: "+ path);
		
		try {
		
			sfu.setSizeMax(getSize() * MB); 
			List list = sfu.parseRequest(request);
			Iterator iterator = list.iterator();
			
			while(iterator.hasNext()) {
				FileItem item = (FileItem) iterator.next();
				
				if (!item.isFormField()) {
					filename = item.getName();
					
					if ((filename != null) && !filename.equals("")) {
						filename = new File(filename).getName();
						if (isPermission(filename)) {
							item.write(new File(path +"/"+ filename));
						} else {
							setErro("Arquivo não permitido");
							return false;
						}
					}
				}
			}
		} catch (FileUploadBase.SizeLimitExceededException e) { 
			setErro("tamanho excedido, máximo: "+ sfu.getSizeMax());
			e.printStackTrace();
			return false;
		} catch (FileUploadException e) {
			setErro("Erro: "+ e.getMessage());
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			setErro("Uma exceção ocorreu: "+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public boolean isPermission(String filename) {
		String lowerCaseName = filename.toLowerCase();
		StringTokenizer st = new StringTokenizer(extensoesPermitidas, ",");
		
		while(st.hasMoreTokens()) {
			if(lowerCaseName.endsWith("."+ st.nextToken())) {
				return true;
			}
		}
		return false;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

	public String getExtensoesPermitidas() {
		return extensoesPermitidas;
	}

	public void setExtensoesPermitidas(String extensoesPermitidas) {
		this.extensoesPermitidas = extensoesPermitidas;
	}
}
