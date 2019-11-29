package logic;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validacion {
	
	
	
	public static Boolean valFecha(String dia, String mes, String a�o) {
		System.out.println("Estoy en valFecha");
		Calendar c = new GregorianCalendar();
		int diaActual = c.get(Calendar.DATE);
		int mesActual = c.get(Calendar.MONTH)+1;
		int a�oActual = c.get(Calendar.YEAR);
		
		String DD = String.valueOf(diaActual);
		String MM = String.valueOf(mesActual);
		String AAAA = String.valueOf(a�oActual);
		
		System.out.println(DD+'/'+MM+'/'+AAAA);
		
		Pattern patA�o = Pattern.compile("[2][0-9]{3}"); 
		Matcher matA�o = patA�o.matcher(a�o);
		if(matA�o.matches()) {
			System.out.println("El patron respecto al a�o es correcto!");
			int a = Integer.parseInt(a�o);
			Pattern patMes = Pattern.compile("[0][1-9]|[1][0-2]");
			Matcher matMes = patMes.matcher(mes);
			if(matMes.matches()) {
				System.out.println("El patron respecto al mes es correcto!");
				int m = Integer.parseInt(mes);
				Pattern patDia = Pattern.compile("[0][1-9]|[1-2][0-9]|[3][0-1]");
				Matcher matDia = patDia.matcher(dia);
				if(matDia.matches()) {
					System.out.println("El patron respecto al dia es correcto!");
					int d = Integer.parseInt(dia);
					if(a>a�oActual) {
						System.out.println("Fecha v�lida!: a>a�oActual");
						return true;						
					}else if(a==a�oActual) {
						if(m>mesActual) {
							System.out.println("Fecha v�lida!: a==a�oActual y m>mesActual");
							return true;
						}else if(m==mesActual) {
							if (d>=diaActual) {
								System.out.println("Fecha v�lida!: m==mesActual y d>=diaActual");
								return true;
							}else { System.out.println("D�a inv�lido");
									return false;}
						}else { System.out.println("El mes ingresado no es v�lido para el a�o actual");
								return false;}
					}else { System.out.println("El a�o ingresado no es v�lido");
							return false;}
				}System.out.println("El dia ingresado no es v�lido");
				return false;
			}System.out.println("El mes ingresado no es v�lido");
			return false;
		}else {System.out.println("El a�o ingresado no es v�lido");
		return false;			
		}	
	}
	
	public Boolean valEmail(String email) {
		Pattern patEmail = Pattern.compile("[a-z]+[a-zA-Z0-9]+@{1}[a-z]+.[a-z](.[a-z]+)*");
		Matcher matEmail = patEmail.matcher(email);
		if(matEmail.matches()) {
			return true;
		}else {
			return false;
		}
	}
}
