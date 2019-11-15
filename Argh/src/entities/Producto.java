package entities;

import java.util.ArrayList;

public class Producto {
	private int id, stock;
	private String nombre, desc, tipo;
	private float precio;
	private ArrayList<LineaPedido> pedidos;
	
	//Getters & Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public ArrayList<LineaPedido> getPedidos() {
		return pedidos;
	}
	public void setPedidos(ArrayList<LineaPedido> pedidos) {
		this.pedidos = pedidos;
	}
	
	//Métodos
	public void actualziarStock(int c) {
		if(c>stock) {
			stock =0;
		}else {
			stock=-c;
		}
	}
}
