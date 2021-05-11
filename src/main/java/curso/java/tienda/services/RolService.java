package curso.java.tienda.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import curso.java.tienda.models.Roles;
import curso.java.tienda.repository.RolRepository;

@Service
public class RolService {

	@Autowired
	private RolRepository repository;
	
	public Iterable<Roles> getAll(){
		
		return repository.findAll();
	}
}