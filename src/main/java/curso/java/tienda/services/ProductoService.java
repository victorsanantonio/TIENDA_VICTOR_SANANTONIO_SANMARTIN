package curso.java.tienda.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import curso.java.tienda.models.Productos;
import curso.java.tienda.repository.ProductoRepository;


@Service
public class ProductoService {

	@Autowired
	private ProductoRepository repository;
	
	public Iterable<Productos> getAll() {
        return repository.findAll();
    }
	
	public Productos getProducto(int id) {
		
		return repository.findById(id);
	}
	
	public void deleteProducto(int id) {
		repository.deleteById((long)id);
	}
	
	public void addProducto(Productos producto) {
		
		repository.save(producto);
	}
}