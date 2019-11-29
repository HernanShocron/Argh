/*EVENTOS*/
insert into evento (fecha, lugar) values
('20191001', 'Av. Pellegrini 3806 Salon 2'),
('20191010', 'Av. Pellegrini 3806 Salon 3'),
('20191020', 'Francia 3806'),
('20191030', 'Ov. Lagos 4806 Salon 5'),
('20191110', 'Corrientes 2000'),
('20191120', 'Entre Rios 756 Salon 1'),
('20191130', 'Zeballos 500');

/*Para ver los elementos*/
select * from evento order by Fecha desc ;

/*Para reiniciar la tabla*/

TRUNCATE TABLE evento;


