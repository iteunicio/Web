package mz.com.caelum.tarefas.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
