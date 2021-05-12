package curso.java.tienda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import curso.java.tienda.models.Roles;
import curso.java.tienda.models.Usuarios;
import curso.java.tienda.services.RolService;
import curso.java.tienda.services.UsuarioService;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	private UsuarioService us;
	@Autowired
	private RolService rs;

	@GetMapping("/anhadir")
	public String add(Model model) {
		
		model.addAttribute("usuario", new Usuarios());
		
		return "usuario/anhadir";
	}
	
	@PostMapping("/anhadir/submit")
	public String addSubmit(Model model, @ModelAttribute Usuarios usuario) {
		
		us.addUsuario(usuario);
		
		return "redirect:/usuario";
	}
	
	@GetMapping("/editar/{id}")
	public String editar(Model model, @PathVariable("id") int id) {
		
		Usuarios usuario = us.getUsuario(id);
		model.addAttribute("usuario", usuario);
		
		return "/usuario/editar";
	}
	
	@PostMapping("/editar/submit")
	public String editarSubmit(Model model, @ModelAttribute Usuarios usuario) {
		
		us.addUsuario(usuario);
		
		return "redirect:/usuario";
	}
	
	@GetMapping("/baja/{id}")
	public String delete(Model model, @PathVariable("id") int id) {

		us.deleteUsuario(id);

		return "redirect:/usuario";
	}

	@GetMapping("")
	public String listar(Model model) {
		Iterable<Roles> roles = null;
		roles = rs.getAll();
		System.out.println(roles);
		model.addAttribute("roles", roles);

		Iterable<Usuarios> usuarios = null;
		usuarios = us.getAll();
		model.addAttribute("usuarios", usuarios);

		return "/usuario/usuario";
	}

}