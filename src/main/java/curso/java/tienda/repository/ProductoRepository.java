package curso.java.tienda.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import curso.java.tienda.models.Producto;


public interface ProductoRepository extends JpaRepository<Producto, Long> {
	
}