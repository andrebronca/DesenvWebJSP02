package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;

@WebServlet("/logar")
public class Logar extends HttpServlet {
	private static final long serialVersionUID = -7020071217446929271L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("Cache-Control", "no-cache, must-revalidate");
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Expires", "Fri, 25 Jan 2022 00:00:00 GMT"); //ixi, tem que deixar essa data correta
		
		String usuario = req.getParameter("usuario");
		String senha = req.getParameter("senha");
		RequestDispatcher rd = null;
		
		Usuario user = new Usuario();
		user.setUsuario(usuario);
		user.setSenha(senha);
		
		if (user.verificaUsuario()) {
			HttpSession sessao = req.getSession();
			sessao.setAttribute("USER", usuario);
			rd = req.getRequestDispatcher("/logado.jsp");
			rd.forward(req, resp);
		} else {
			req.setAttribute("msg", "Usuário ou senha inválido!");
			rd = req.getRequestDispatcher("/logar.jsp");
			rd.forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
