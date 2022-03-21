package meupacote.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import meupacote.Livros;
import meupacote.util.ConnectionLivrariaFactory;

public class LivrariaDAO implements InterfaceLivrosDAO {
	@SuppressWarnings("unused")
	private Connection conn;
	
	public LivrariaDAO() throws LivrariaDAOException {
		try {
			this.conn = ConnectionLivrariaFactory.getConnection();
		} catch(Exception e) {
			throw new LivrariaDAOException("Erro: "+ e.getMessage());
		}
	}
	
	@Override
	public void salvar(Livros livro) throws LivrariaDAOException {
		PreparedStatement ps = null;
		Connection conn = null;
		if (livro == null) {
			throw new LivrariaDAOException("O valor passado não pode ser nulo");
		}
		
		try {
			String sql = "insert into livros (isbn,titulo,edicao_num,ano_publicacao,descricao) values (?,?,?,?,?)";
			conn = this.conn;
			ps = this.conn.prepareStatement(sql);
			ps.setString(1, livro.getIsbn());
			ps.setString(2, livro.getTitulo());
			ps.setInt(3, livro.getEdicao());
			ps.setInt(4, livro.getPublicacao());
			ps.setString(5, livro.getDescricao());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			throw new LivrariaDAOException("Erro ao inserir dados "+ e);
			
		} finally {
			ConnectionLivrariaFactory.closeConnection(conn, ps);
		}
	}
	
	@Override
	public void excluir(Livros livro) throws LivrariaDAOException {
		PreparedStatement ps = null;
		Connection conn = null;
		if (livro == null) {
			throw new LivrariaDAOException("O valor passado não pode ser nulo");
		}
		
		try {
			conn = this.conn;
			ps = conn.prepareStatement("update livros set excluido='*' where isbn=?");
			ps.setString(1, livro.getIsbn());
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new LivrariaDAOException("Erro ao excluir dados: "+ e.getMessage());
		} finally {
			ConnectionLivrariaFactory.closeConnection(conn, ps);
		}
	}
	
	@Override
	public void atualizar(Livros livro) throws LivrariaDAOException {
		PreparedStatement ps = null;
		Connection conn = null;
		
		if (livro == null) {
			throw new LivrariaDAOException("O valor passado não pode ser nulo");
		}
		
		try {
			String sql = "update livros set titulo=?, edicao_num=?, ano_publicacao=?, descricao=? where isbn=?";
			conn = this.conn;
			ps = conn.prepareStatement(sql);
			ps.setString(1, livro.getTitulo());
			ps.setInt(2, livro.getEdicao());
			ps.setInt(3, livro.getPublicacao());
			ps.setString(4, livro.getDescricao());
			ps.setString(5, livro.getIsbn());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			throw new LivrariaDAOException("Erro ao autalizar dados: "+ e.getMessage());
		} finally {
			ConnectionLivrariaFactory.closeConnection(conn, ps);
		}
	}

	@Override
	public List<Livros> todosLivros() throws LivrariaDAOException {
		PreparedStatement ps = null;
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = this.conn;
			ps = conn.prepareStatement("select * from livros where excluido is null");
			rs = ps.executeQuery();
			List<Livros> livros = new ArrayList<Livros>();
			while(rs.next()) {
				//há duas formas de recuperar os dados, através do nome da coluna ou da posição, iniciando em 1.
				//outra forma seria atribuir cada valor a uma variável, depois setar o objeto e adicionar no list.
				livros.add(new Livros(rs.getString("isbn"), rs.getString("titulo"), rs.getInt(3), rs.getInt("ano_publicacao"), rs.getString(5)));
			}
			return livros;
			
		} catch (SQLException e) {
			throw new LivrariaDAOException("Erro ao listar os livros: "+ e.getMessage());
		} finally {
			ConnectionLivrariaFactory.closeConnection(conn, ps, rs);
		}
	}

	@Override
	public Livros procurarLivro(String isbn) throws LivrariaDAOException {
		PreparedStatement ps = null;
		Connection conn = null;
		ResultSet rs = null;
		
		if (isbn == null) {
			throw new LivrariaDAOException("O valor passado não pode ser nulo");
		}
		
		try {
			conn = this.conn;
			ps = conn.prepareStatement("select * from livros where isbn = ?");
			ps.setString(1, isbn);
			rs = ps.executeQuery();
			
			if (!rs.next()) {
				throw new LivrariaDAOException("Não foi encontrado o livro com isbn = "+ isbn);
			}
			
			String titulo = rs.getString(2); //começa obtendo da segunda coluna
			int edicao = rs.getInt(3);
			int publicacao = rs.getInt(4);
			String descricao = rs.getString("descricao");	//outra forma de obter o dado
			
			return new Livros(isbn,titulo,edicao,publicacao,descricao);
			
		} catch (SQLException e) {
			throw new LivrariaDAOException("Erro ao listar o livro: "+ e.getMessage());
		} finally {
			ConnectionLivrariaFactory.closeConnection(conn, ps, rs);
		}
	}

}
