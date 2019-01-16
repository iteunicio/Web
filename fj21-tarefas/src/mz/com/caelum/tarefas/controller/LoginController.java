package mz.com.caelum.tarefas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mz.com.caelum.tarefas.dao.UsuarioDAO;
import mz.com.caelum.tarefas.modelo.Usuario;

@Controller
public class LoginController {

	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}
	
	@RequestMapping("efectuaLogin")
	public String efectuaLogin(Usuario usuario, HttpSession session) 
										throws ClassNotFoundException{
		if(new UsuarioDAO().existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			return "menu";
		}
		
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
	
}
