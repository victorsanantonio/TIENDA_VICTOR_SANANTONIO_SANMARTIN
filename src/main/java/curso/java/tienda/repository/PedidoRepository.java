package curso.java.tienda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import curso.java.tienda.models.Pedido;


public interface PedidoRepository extends JpaRepository<Pedido, Long>{
	Pedido findById(int id);
}
