package curso.java.tienda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import curso.java.tienda.models.Productos;
import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.CarritoService;
import curso.java.tienda.services.ProductoService;

@Controller
@RequestMapping("/carrito")
public class CarritoController {
	
	@Autowired
	private ProductoService ps;
	@Autowired
	private CarritoService cs;
	
	@GetMapping("/carrito")
	public String listar(HttpSession sesion, Model model) {
		if(sesion.getAttribute("carrito") == null) {
			sesion.setAttribute("carrito",new ArrayList<Productos>());
		}
		model.addAttribute("total", cs.total( (ArrayList<Productos>) sesion.getAttribute("carrito")) + " €");
		return "carrito/carrito";
	}
	
	@GetMapping("/anhadir/{id}")
	public String add(HttpSession sesion, Model model,@PathVariable("id") int id) {
		ArrayList<Productos> carrito = null;
		if(sesion.getAttribute("carrito") != null) {
			carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");
			carrito.add(ps.getProducto(id));
		}else {
			carrito = new ArrayList<Productos>();
			carrito.add(ps.getProducto(id));
		}
		sesion.setAttribute("carrito", carrito);
		return "redirect:/";
	}
	
	@GetMapping("/borrar/{id}")
	public String delete(HttpSession sesion, Model model, @PathVariable("id") int id) {
		
		ArrayList<Productos> carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");
		for(int i = 0; i < carrito.size(); i++) {
			Productos p = carrito.get(i);
			if(p.getId() == id) {
				carrito.remove(p);
			}
		}
		return "redirect:/carrito/carrito";
	}
	
	@GetMapping("/pedido")
	public String pedido(HttpSession sesion, Model model, @RequestParam String pago) {
		Usuarios user = (Usuarios) sesion.getAttribute("usuario");
		if(user != null) {
			ArrayList<Productos> carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");
			sesion.setAttribute("carrito", new ArrayList<Productos>());
			return "pedidos/pagado";
		}
		
		return "redirect:/login/acceso";
	}
}