package curso.java.tienda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import curso.java.tienda.models.Producto;

public interface UsuarioRepository extends JpaRepository<Producto, Long> {

}
