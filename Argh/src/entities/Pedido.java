package entities;

import java.util.ArrayList;
import java.util.Date;

public class Pedido {
	private int 					nroPedido;
	private Date					fechaPedido;
	private Mesa 					mesa;
	private ArrayList<LineaPedido> 	pedidos;
	private float					total;
	
	//Getters & Setters
	public int getNroPedido() {
		return nroPedido;
	}
	public void setNroPedido(int nroPedido) {
		this.nroPedido = nroPedido;
	}
	public Date getFechaPedido() {
		return fechaPedido;
	}
	public void setFechaPedido(Date fechaPedido) {
		this.fechaPedido = fechaPedido;
	}
	public Mesa getMesa() {
		return mesa;
	}
	public void setMesa(Mesa mesa) {
		this.mesa = mesa;
	}
	public ArrayList<LineaPedido> getPedidos() {
		return pedidos;
	}
	public void setPedidos(ArrayList<LineaPedido> pedidos) {
		this.pedidos = pedidos;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
}
