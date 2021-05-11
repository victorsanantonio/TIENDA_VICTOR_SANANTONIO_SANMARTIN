package curso.java.tienda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import curso.java.tienda.models.Usuarios;

@Controller
@RequestMapping("")
public class LoginController {
	
	@GetMapping("/login")
	public String saludo(Model model) {
		Usuarios usuario = new Usuarios();
		model.addAttribute("usuario", usuario );
		return "login";
	}
	
	@PostMapping("/saludo")
	public String loginQuery(Model model, @ModelAttribute("usuario") Usuarios usuario) {
		model.addAttribute("usuario", usuario);
		return "saludo";
	}
}