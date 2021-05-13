package curso.java.tienda.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

	public void obtenerImagen() {
		for(Productos p : productoService.getAll()) {
			establecerImagenAlmacenada(p.getImagen());
		}
	}
	
	private void establecerImagenAlmacenada(byte[] imagenBArray) {
        try {
            ByteArrayInputStream bais = new ByteArrayInputStream(imagenBArray);
            BufferedImage bi = ImageIO.read(bais);
            File f = new File("src/main/resources/static/images/imagen_producto.jpg");
            ImageIO.write(bi, "jpg", f);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
	
	@GetMapping("")
	public String listar(HttpSession sesion, Model model) {
		model.addAttribute("productos", productoService.getAll());
		
		if(sesion.getAttribute("carrito")==null) {
			ArrayList<Productos> carrito = new ArrayList<Productos>();
			sesion.setAttribute("carrito", carrito);
		}
		
		if ((String)sesion.getAttribute("nombre") == null) {
			sesion.setAttribute("nombre", "");
		}
		sesion.getAttribute("carrito");
		sesion.setAttribute("carrito", carrito);
		return "index";
	}
	
	@GetMapping("/anhadir/{id}")
	public String add(HttpSession sesion, Model model,@PathVariable("id") int id) {
		ArrayList<Productos> carrito = null;
		if(sesion.getAttribute("carrito") != null) {
			carrito = (ArrayList<Productos>) sesion.getAttribute("carrito");
			carrito.add(productoService.getProducto(id));
		}else {
			carrito = new ArrayList<Productos>();
			carrito.add(productoService.getProducto(id));
		}
		sesion.setAttribute("carrito", carrito);
		return "redirect:/";
	}
	
	/*
	 * @GetMapping("/prueba") public String metodo2(HttpSession sesion) { String
	 * nombre = (String)sesion.getAttribute("nombre"); System.out.println(nombre);
	 * return "sesion"; }
	 */
}
