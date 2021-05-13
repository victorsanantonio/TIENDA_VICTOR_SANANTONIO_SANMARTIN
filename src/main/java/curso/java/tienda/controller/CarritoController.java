package curso.java.tienda.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import curso.java.tienda.models.Productos;
import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.CarritoService;
import curso.java.tienda.services.ProductoService;
import curso.java.tienda.services.UsuarioService;

@Controller
@RequestMapping("/carrito")
public class CarritoController {
	double total = 0d;
	@Autowired
	private ProductoService ps;
	@Autowired
	private CarritoService cs;
	@Autowired
	private UsuarioService us;

	@GetMapping("")
	public String listar(HttpSession sesion, Model model) {
		ArrayList<Productos> carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");

		if (carrito == null) {
			sesion.setAttribute("carrito", new ArrayList<Productos>());
		}

		total = cs.total(carrito);
		model.addAttribute("total", total + " €");
		return "carrito/carrito";
	}

	@GetMapping("/borrar/{id}")
	public String delete(HttpSession sesion, Model model, @PathVariable("id") int id) {

		ArrayList<Productos> carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");
		for (int i = 0; i < carrito.size(); i++) {
			Productos p = carrito.get(i);
			if (p.getId() == id) {
				carrito.remove(p);
			}
		}
		return "redirect:/carrito";
	}

	@GetMapping("/carrito")
	public String compra(HttpSession sesion, Model model) {
		String email = (String) sesion.getAttribute("nombre");
		Usuarios usuario = us.getUsuario(email);
		
		ArrayList<Productos> productos = (ArrayList<Productos>) sesion.getAttribute("carrito");
		//String metodo_pago = (String) sesion.getAttribute("metodo_pago");
		String metodo_pago = "PayPal";
		Pedido pedido = new Pedido(1, usuario.getId(), new Date(), metodo_pago, "pedido", "000001", total);
		sesion.setAttribute("carrito",null);
		ArrayList<Productos> carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");
		return "redirect:/";
	}
}