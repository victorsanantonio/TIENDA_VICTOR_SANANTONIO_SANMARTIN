package curso.java.tienda.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import curso.java.tienda.models.Productos;
import curso.java.tienda.services.ProductoService;

@Controller
@RequestMapping("")
public class ProductoController {

	@Autowired
	private ProductoService productoService;

	@GetMapping("")
	public String listarProductos(Model model) {
		model.addAttribute("productos", productoService.getListaProductos());
		return "index";
	}
}
