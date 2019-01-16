package mz.com.caelum.tarefas.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mz.com.caelum.tarefas.dao.TarefaDAO;
import mz.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class TarefasController {

	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/form";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) 
										throws ClassNotFoundException {
		if(result.hasFieldErrors("descricao"))
			return "tarefa/form";
		
		TarefaDAO dao = new TarefaDAO();
		dao.adiciona(tarefa);
		
		return "tarefa/adicionada";
	}
	
	@RequestMapping("listaTarefas")
	public String lista(Model model) throws ClassNotFoundException {
		try {
			TarefaDAO dao = new TarefaDAO();
			model.addAttribute("tarefas", dao.getLista());
				//	O nome do model é tarefas que contém a lista...
		} catch (Exception e) {
			return "tarefa/erro";
		}
		
		return "tarefa/lista";
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) throws ClassNotFoundException {
		TarefaDAO dao = new TarefaDAO();
		dao.remove(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) throws ClassNotFoundException {
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) throws ClassNotFoundException {
		TarefaDAO dao = new TarefaDAO();
		dao.altera(tarefa);
		return "redirect:listaTarefas:";
	}
	
	@ResponseBody
	@RequestMapping("finalizaTarefa")
	public void finaliza( Long id, Model model) throws ClassNotFoundException {
		TarefaDAO dao = new TarefaDAO();
		dao.finaliza(id);
		model.addAttribute("tarefa", dao.buscaPorId(id));
		//return "tarefa/finalizada";
	}
	
}
