package curso.java.tienda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import curso.java.tienda.services.ProductoService;

@Controller
@RequestMapping("")
public class ProductoController {

	@Autowired
	private ProductoService productoService;

	@GetMapping("")
	public String listar(Model model) {
		
		model.addAttribute("productos", productoService.getAll());
		
		return "index";
	}
}
