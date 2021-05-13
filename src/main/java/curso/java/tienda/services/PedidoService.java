package curso.java.tienda.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import curso.java.tienda.models.Pedido;
import curso.java.tienda.repository.PedidoRepository;

@Service
public class PedidoService {
	@Autowired
	private PedidoRepository repository;
	
	public Iterable<Pedido> getAll() {
        return repository.findAll();
    }
	
	public Pedido getPedido(int id) {
		
		return repository.findById(id);
	}
	
	public void deletePedido(int id) {
		repository.deleteById((long)id);
	}
	
	public void addPedido(Pedido pedido) {
		
		repository.save(pedido);
	}
}
