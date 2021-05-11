package curso.java.tienda.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import curso.java.tienda.models.Productos;


public interface ProductoRepository extends JpaRepository<Productos, Long> {
	Productos findById(int id);
	//Iterable<Productos> findByIdCategorias(int id);
}