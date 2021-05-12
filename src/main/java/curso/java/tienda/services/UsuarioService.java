package curso.java.tienda.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import curso.java.tienda.models.Usuarios;
import curso.java.tienda.repository.UsuarioRepository;
import curso.java.tienda.util.Encrypter;

@Service
public class UsuarioService {
	static Encrypter encrypter = new Encrypter();

	@Autowired
	private UsuarioRepository repository;

	public Iterable<Usuarios> getAll() {
		return repository.findAll();
	}

	public Usuarios getUsuario(int id) {
		return repository.findById(id);
	}

	public Usuarios getUsuario(String email) {
		return repository.findByEmail(email);
	}

	public Usuarios validarLogin(String email, String clave) {
		Usuarios user = getUsuario(email);
		if (user != null) {
			if (encrypter.desencryptedPassword(user.getClave()).equals(clave)) {
				System.out.print("Usuario es correcto");
				return user;
			}
		}
		else {
			System.out.print("El usuario no es correcto");
		}
		return null;
	}

	public void addUsuario(Usuarios usuario) {
		usuario.setClave(encrypter.encryptedPassword(usuario.getClave()));
		repository.save(usuario);
	}
	
	public void deleteUsuario(int id) {
		repository.deleteById(id);
	}
}
