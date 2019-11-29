package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.EventoData;
import entities.Evento;
import logic.Validacion;


@WebServlet("/EventosServlet")
public class EventosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EventosServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("He llegado al doGet con id="+request.getParameter("id") );
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("He llegado al doPost!");
		String add = request.getParameter("añadir");
		String delete = request.getParameter("eliminar");
		String update = request.getParameter("modificar");
		String updateconfirm = request.getParameter("updateconfirm");
		EventoData ed= new EventoData();
		
		if(add != null) {
			System.out.println("add != null");
			String dia = request.getParameter("dia");
			String mes = request.getParameter("mes");
			String año = request.getParameter("año");			
			String fecha= año+'-'+mes+'-'+dia;
			String lugar= request.getParameter("lugar");
			if(Validacion.valFecha(dia,mes,año)) {
				System.out.println("Validación de fecha correcta!");
				try {
					ed.insertOne(fecha, lugar);
					System.out.println("Se añadió el evento para la fecha "+fecha);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("EventosInsert.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "Fecha Inválida!");
				System.out.println("No entré al if de validación");
			};
			
			
		}else if(delete != null) {
				try {
					ed.deleteOne(delete);
				} catch (SQLException e) {
					System.out.println("No se ha podido eliminar el registro con id "+delete);
					e.printStackTrace();
				}
				request.getRequestDispatcher("Eventos.jsp").forward(request, response);
				
				
		}else if(update != null) {
			System.out.println("Estoy en el update del id= "+update);
			try {
				Evento e = ed.getOne(update);
				request.setAttribute("id", e.getId());
				request.setAttribute("dia", e.getDia());
				request.setAttribute("mes", e.getMes());
				request.setAttribute("año", e.getAño());
				request.setAttribute("lugar", e.getLugar());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("EventosUpdate.jsp");
			rd.forward(request, response);
			
			
		}else if(updateconfirm != null) {

			String id = request.getParameter("id");
			String dia = request.getParameter("dia");
			String mes = request.getParameter("mes");
			String año = request.getParameter("año");
			String fecha= año+'-'+mes+'-'+dia;
			String lugar= request.getParameter("lugar");
			if(Validacion.valFecha(dia,mes,año)) {
				System.out.println("Validación de fecha correcta!");
				try {
					ed.updateOne(id,fecha,lugar);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("Eventos.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "Fecha Inválida!");
				System.out.println("No entré al if de validación");
			};
		}
	}

}
