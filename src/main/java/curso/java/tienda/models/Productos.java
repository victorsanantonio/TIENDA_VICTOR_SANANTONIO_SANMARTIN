package curso.java.tienda.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class Productos {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int id_categoria;
	
	@Size(max=255, message="El nombre no debe de superar los 255 dígitos")
	private String nombre;
	
	@Size(max=255, message="La descripción no debe de superar los 255 dígitos")
	private String descripcion;
	private double precio;
	
	@Size(max=11, message="No puedes introducir más de 11 productos")
	private int stock;
	
	@CreatedDate
	@Temporal(TemporalType.TIMESTAMP)
	private Date fecha_alta;
	
	@CreatedDate
	@Temporal(TemporalType.TIMESTAMP)
	private Date fecha_baja;
	private float impuesto;
	
	public Productos() {}
	
	public Productos(int id, int id_categoria, String nombre, String descripcion, double precio, int stock,
			Date fecha_alta, Date fecha_baja, float impuesto) {
		super();
		this.id = id;
		this.id_categoria = id_categoria;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.stock = stock;
		this.fecha_alta = fecha_alta;
		this.fecha_baja = fecha_baja;
		this.impuesto = impuesto;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_categoria() {
		return id_categoria;
	}

	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Date getFecha_alta() {
		return fecha_alta;
	}

	public void setFecha_alta(Date fecha_alta) {
		this.fecha_alta = fecha_alta;
	}

	public Date getFecha_baja() {
		return fecha_baja;
	}

	public void setFecha_baja(Date fecha_baja) {
		this.fecha_baja = fecha_baja;
	}

	public float getImpuesto() {
		return impuesto;
	}

	public void setImpuesto(float impuesto) {
		this.impuesto = impuesto;
	}

	@Override
	public String toString() {
		return "Producto [id=" + id + ", id_categoria=" + id_categoria + ", nombre=" + nombre + ", descripcion="
				+ descripcion + ", precio=" + precio + ", stock=" + stock + ", fecha_alta=" + fecha_alta
				+ ", fecha_baja=" + fecha_baja + ", impuesto=" + impuesto + "]";
	}
}
