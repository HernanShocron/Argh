package entities;

import java.util.ArrayList;
import java.util.Date;

public class Pedido {
	private int nroPedido;
	private String estado;
	private Mesa mesa;
	private ArrayList<LineaPedido> lineasPedido;
	private float total;
	
	//Getters & Setters
	public int getNroPedido() {
		return nroPedido;
	}
	public void setNroPedido(int nroPedido) {
		this.nroPedido = nroPedido;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Mesa getMesa() {
		return mesa;
	}
	public void setMesa(Mesa mesa) {
		this.mesa = mesa;
	}
	public ArrayList<LineaPedido> getLineasPedido() {
		return lineasPedido;
	}
	public void setPedidos(ArrayList<LineaPedido> lineasPedido) {
		this.lineasPedido = lineasPedido;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
	//Métodos
	public void calcularTotal() {
		total = 0;
		for(LineaPedido lp: lineasPedido) {
			total=+ lp.calcularSubTotal();
		}
	}
	
}
