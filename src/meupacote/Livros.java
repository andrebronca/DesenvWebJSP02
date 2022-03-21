package meupacote;

import java.io.Serializable;

public class Livros implements Serializable {
	private static final long serialVersionUID = -8654393075981574812L;
	private String isbn;
	private String titulo;
	private int edicao;
	private int publicacao;
	private String descricao;
	
	public Livros() {}

	public Livros(String isbn, String titulo, int edicao, int publicacao, String descricao) {
		this.isbn = isbn;
		this.titulo = titulo;
		this.edicao = edicao;
		this.publicacao = publicacao;
		this.descricao = descricao;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public int getEdicao() {
		return edicao;
	}

	public void setEdicao(int edicao) {
		this.edicao = edicao;
	}

	public int getPublicacao() {
		return publicacao;
	}

	public void setPublicacao(int publicacao) {
		this.publicacao = publicacao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + edicao;
		result = prime * result + ((isbn == null) ? 0 : isbn.hashCode());
		result = prime * result + publicacao;
		result = prime * result + ((titulo == null) ? 0 : titulo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Livros other = (Livros) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (edicao != other.edicao)
			return false;
		if (isbn == null) {
			if (other.isbn != null)
				return false;
		} else if (!isbn.equals(other.isbn))
			return false;
		if (publicacao != other.publicacao)
			return false;
		if (titulo == null) {
			if (other.titulo != null)
				return false;
		} else if (!titulo.equals(other.titulo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Livros [isbn=" + isbn + ", titulo=" + titulo + ", edicao=" + edicao + ", publicacao=" + publicacao
				+ ", descricao=" + descricao + "]";
	}
	
	
	
}
