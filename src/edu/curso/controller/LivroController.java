package edu.curso.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.curso.entity.Livro;
@WebServlet("/livroController")
public class LivroController extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		ServletContext app = req.getServletContext();
		HttpSession session = req.getSession();
		List<Livro> livros = (List<Livro>)app.getAttribute("LIVROS");
		if(livros  == null) {
			livros = new ArrayList<>();
			app.setAttribute("LIVROS", livros);
		}		
		
		String acao = req.getParameter("cmd");
		
		Livro livro = new Livro();
		
		try {
			livro.setTitulo(req.getParameter("txtTitulo"));
			livro.setAutor(req.getParameter("txtAutor"));
			livro.setPaginas(Integer.parseInt(req.getParameter("txtPaginas")));
			livro.setEditora(req.getParameter("txtEditora"));
			livro.setGenero(req.getParameter("txtGenero"));
			livro.setId(Long.parseLong(req.getParameter("txtID")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg="";
		if("adicionar".equals(acao)) {
			livros.add(livro);	
			msg = String.format("livro adicionado há %d livros na lista",livros.size());
			
		}else if ("pesquisar".equals(acao)) {
			List<Livro> localizados = new ArrayList<>();
			for (Livro l : livros) { 
				if (l.getTitulo().contains(livro.getTitulo())) { 
					localizados.add(l);
				}
			}
			msg = String.format(
					"Foram localizados %d livros com este titulo %s", 
					localizados.size(), livro.getTitulo());
			session.setAttribute("LIVROS", localizados);
		}
					
		System.out.println(msg);
				
		session.setAttribute("MENSAGEM", msg);
		res.sendRedirect("./livro.jsp");
	}
}
