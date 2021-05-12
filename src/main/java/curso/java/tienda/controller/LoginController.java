package curso.java.tienda.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.UsuarioService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UsuarioService us;

	@GetMapping("")
	public String acceso() {
		
		return "login";
	}
	
	@PostMapping("/acceso/validar")
	public String validarAcceso(/*HttpSession sesion, Model model, @RequestParam(required = true) String username, @RequestParam(required = true) String password*/) {
		
		Usuarios user = us.validarLogin("", "");
		//sesion.setAttribute("usuario", user);
		
		if(user != null) {
			return "redirect:/";
			
		}else {
			return "redirect:/login/acceso/validar";
		}
	}
}