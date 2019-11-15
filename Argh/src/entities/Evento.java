package entities;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Evento {
	private int		id;
	private Date	fecha;
	private String 	desc;
	
	//Getters & Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getDia() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		String dia = sdf.format(fecha);
		return dia;
	}
	public String getMes() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		String mes = sdf.format(fecha);
		return mes;
	}
	public String getAño() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String año = sdf.format(fecha);
		return año;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
