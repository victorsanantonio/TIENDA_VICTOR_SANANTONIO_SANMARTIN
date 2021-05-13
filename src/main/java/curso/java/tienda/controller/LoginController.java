package curso.java.tienda.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.UsuarioService;

@Controller
@RequestMapping("")
public class LoginController {

	@Autowired
	private UsuarioService us;

	@GetMapping("login")
	public String acceso() {
		return "login";
	}
	
	@PostMapping("/login/acceso/validar")
	public String validarAcceso(HttpSession sesion, Model model, @RequestParam(required = true) String username, @RequestParam(required = true) String password) {
		Usuarios user = null;
		user = us.validarLogin(username, password);
		//sesion.setAttribute("usuario", user);
		sesion.setAttribute("nombre", username);
		
		if(user != null) {
			return "redirect:/";
			
		}else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("registrar")
	public String registrar(Model model) {
		model.addAttribute("usuario", new Usuarios());
		return "registrar";
	}
	
	@PostMapping("/registrar/submit")
	public String addSubmit(Model model, @ModelAttribute Usuarios usuario) {
		us.addUsuario(usuario);
		return "redirect:/login";
	}
}