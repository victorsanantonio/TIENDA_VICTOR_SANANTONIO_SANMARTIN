package curso.java.tienda.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import curso.java.tienda.models.Productos;
import curso.java.tienda.repository.ProductoRepository;


@Service
public class ProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    public Iterable getListaProductos() {
        return productoRepository.findAll();
    }

    public void addProducto(Productos producto) {
        productoRepository.save(producto);
    }
}