package model;

public class Usuario {
	private String usuario = null;
	private String senha = null;

	public boolean verificaUsuario() {
		if (this.usuario != null && this.senha != null) {
			if (this.usuario.equals("admin") && this.senha.equals("admin")) {
				return true;
			}
		}
		return false;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
