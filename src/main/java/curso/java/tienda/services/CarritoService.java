package curso.java.tienda.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import curso.java.tienda.models.Productos;

@Service
public class CarritoService {
	public double total(ArrayList<Productos> productos) {
		double total = 0; 
		for(int i = 0; i < productos.size(); i++) {
			Productos producto = productos.get(i);
			total += producto.getPrecio();
		}
		return total;
	}
}