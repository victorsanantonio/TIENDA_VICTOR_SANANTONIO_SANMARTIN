package curso.java.tienda.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import curso.java.tienda.models.Pedido;
import curso.java.tienda.models.Productos;
import curso.java.tienda.services.PedidoService;

@Controller
@RequestMapping("")
public class PedidoController {

	@Autowired
	private PedidoService ps;

	@GetMapping("/pedidos")
	public String listar(HttpSession sesion, Model model) {
		ArrayList<Pedido> pedidos = (ArrayList<Pedido>) sesion.getAttribute("pedidos");
		if(pedidos==null) {
			model.addAttribute("pedidos", null);
		}
		else{
			model.addAttribute("pedidos", pedidos);
		}
		
		
		/*if(sesion.getAttribute("pedidos")==null) {
			pedidos = new ArrayList<Pedido>();
			sesion.setAttribute("pedidos", pedidos);
		}*/
		
		//sesion.setAttribute("pedidos", pedidos);
		return "pedidos";
	}
	
	@GetMapping("/baja/{id}")
	public String delete(Model model, @PathVariable("id") int id) {
		ps.deletePedido(id);
		return "redirect:/pedidos";
	}
}