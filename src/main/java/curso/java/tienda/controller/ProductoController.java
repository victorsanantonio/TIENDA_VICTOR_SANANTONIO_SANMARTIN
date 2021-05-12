package curso.java.tienda.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import curso.java.tienda.models.Productos;
import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.ProductoService;

@Controller
@RequestMapping("")
public class ProductoController {

	List<Productos> carrito = new ArrayList<>();
	
	@Autowired
	private ProductoService productoService;

	@GetMapping("")
	public String listar(HttpSession sesion, Model model) {
		model.addAttribute("productos", productoService.getAll());
		List<Productos> carrito = new ArrayList<>();
		sesion.setAttribute("carrito", carrito);
		
		if ((String)sesion.getAttribute("nombre") == null) {
			sesion.setAttribute("nombre", "");
		}
		return "index";
	}
	
	/*
	 * @GetMapping("/prueba") public String metodo2(HttpSession sesion) { String
	 * nombre = (String)sesion.getAttribute("nombre"); System.out.println(nombre);
	 * return "sesion"; }
	 */
}
