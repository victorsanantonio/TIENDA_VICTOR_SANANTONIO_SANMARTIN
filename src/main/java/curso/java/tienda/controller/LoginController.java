package curso.java.tienda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import curso.java.tienda.models.Productos;
import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.UsuarioService;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	private UsuarioService us;

	@GetMapping("/login")
	public String acceso() {

		return "/login";
	}

	@PostMapping("/acceso/validar")
	public String validarAcceso(HttpSession sesion, Model model, @RequestParam(required = true) String login,
			@RequestParam(required = true) String password) {

		Usuarios usuario = us.validarLogin(login, password);
		sesion.setAttribute("usuario", usuario);

		if (usuario != null) {
			// sesion.setAttribute("opcionesMenu", oms.getByIdRol(usuario.getRol()));

			/*
			 * ArrayList<Productos> carrito = new ArrayList<Productos>();
			 * sesion.setAttribute("carrito", carrito);
			 */

			return "redirect:/";

		} else {

			return "redirect:/login/acceso";
		}
	}
}