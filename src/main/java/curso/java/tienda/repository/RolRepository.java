package curso.java.tienda.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import curso.java.tienda.models.Roles;

public interface RolRepository extends JpaRepository<Roles, Integer>{

}