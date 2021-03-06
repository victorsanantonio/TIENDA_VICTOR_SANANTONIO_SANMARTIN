package curso.java.tienda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import curso.java.tienda.models.Usuarios;

public interface UsuarioRepository extends JpaRepository<Usuarios, Integer> {
	Usuarios findById(int id);
	Usuarios findByEmail(String email);
}
