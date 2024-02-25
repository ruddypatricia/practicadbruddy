create schema rentapelis;
set schema 'rentapelis';

CREATE TABLE direcciones (
  id_direcciones INT NOT NULL,
  codigo_postal VARCHAR(45) NOT NULL,
  descripcion_direccion VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_direcciones));

CREATE TABLE socio (
  dni_socio VARCHAR(45) NOT null unique,
  nombre_completo VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  codigo_socio VARCHAR(45) NOT null unique,
  direccion_socio INT NULL,
  PRIMARY KEY (dni_socio),
  constraint fk_direccion_socio foreign key (direccion_socio)
  references direcciones(id_direcciones));

CREATE TABLE peliculas (
  idpeliculas INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  sinopsis VARCHAR(1000) NOT NULL,
  genero VARCHAR(45) NOT NULL,
  director VARCHAR(45) NOT NULL,
  cantidad_disponible INT NOT NULL,
  cantidad_rentada INT NOT NULL,
  PRIMARY KEY (idpeliculas));


CREATE TABLE renta_pelicula (
  id_renta INT not null,
  fecha_renta DATE NOT NULL,
  fecha_devolucion DATE NULL,
  socio_renta VARCHAR(45) NOT NULL,
  peli_rentada INT NOT NULL,
  PRIMARY KEY (id_renta),
  constraint fk_socio_renta foreign key (socio_renta)
  references socio(dni_socio),
  constraint fk_peli_rentada foreign key (peli_rentada)
  references peliculas(idpeliculas));



INSERT INTO direcciones VALUES ('1','46006', 'Avenida la plata 95');
INSERT INTO direcciones VALUES ('2','46007', 'Calle del pianista iturbi 71');
INSERT INTO direcciones VALUES ('3','46008', 'Calle de cuba 32');

INSERT INTO socio VALUES ('2537298u','Manuel Rodriguez', '02-10-1980','672636478','Y34o478','1');
INSERT INTO socio VALUES ('2491782L','Ana Herrera', '04-11-1992','652415267','U890df6','1');
INSERT INTO socio VALUES ('I3684452','Laura Sanchez', '03-05-1987','693256791','98h67R3','2');
INSERT INTO socio VALUES ('3450927N','Felipe Contreras', '12-02-1998','613452678','34M89e6','3');

INSERT INTO peliculas VALUES ('1','Encanto','Mirabel se convierte en la última esperanza para su familia cuando descubre que la magia de Encanto, un lugar especial que bendice a los niños y hogar de los Madrigal, corre un serio peligro.','Infantil, fantasia','Byron Howard, Jared Bush','10','1');
INSERT INTO peliculas VALUES ('2','La llegada','El gobierno contrata a la prestigiosa lingüista Louise Banks para que se comunique con unos alienígenas que han llegado a la Tierra. Conforme ella aprende su idioma, va experimentando regresiones muy intensas que desvelan la verdadera misión que les ha llevado hasta nuestro planeta, corre un serio peligro.','Ciencia ficcion','Denis Villeneuve','7','1');
INSERT INTO peliculas VALUES ('3','Freaks','La pequeña Chloe vive encerrada en su casa porque su padre la quiere proteger del mundo exterior. Un día, Chloe, fascinada y temerosa del exterior, se comunica con un desconocido que le ofrece las maravillas y los horrores a los que ella no tiene acceso.','Terror','Zach Lipovsky, Adam B. Stein', '12','2');
INSERT INTO peliculas VALUES ('4','Bajo terapia','Tres parejas acuden a una inusual sesión de terapia en grupo. La psicóloga les asigna unos sobres con consignas que las parejas tendrán que abordar y analizar entre todos. El encuentro se complicará hasta límites insospechados.','Comedia, romance','Gerardo Herrero', '9','1');
INSERT INTO peliculas VALUES ('5','Wonka','Armado únicamente con muchos sueños y ganas de aventura, el joven chocolatero Willy Wonka conoce a los oompa-loompas y se dispone a cambiar el mundo.','Comedia, fantasia','Paul King', '11','1');

INSERT INTO renta_pelicula VALUES ('1','02-08-2023',null,'2537298u','2');
INSERT INTO renta_pelicula VALUES ('2','02-08-2023',null,'2537298u','3');
INSERT INTO renta_pelicula VALUES ('3','04-09-2023',null,'2491782L','1');
INSERT INTO renta_pelicula VALUES ('4','05-09-2023',null,'2491782L','5');
INSERT INTO renta_pelicula VALUES ('5','07-09-2023',null,'I3684452','1');
INSERT INTO renta_pelicula VALUES ('6','07-09-2023',null,'3450927N','4');
INSERT INTO renta_pelicula VALUES ('7','12-11-2023', '11-15-2023','3450927N','3');
INSERT INTO renta_pelicula VALUES ('8','09-14-2023', '09-16-2023','2491782L','1');
INSERT INTO renta_pelicula VALUES ('9','08-12-2023',null,'I3684452','3');

-- para ver los socios y sus direcciones select codigo_socio,nombre_completo,codigo_postal,descripcion_direccion from socio inner join direcciones on direccion_socio = id_direcciones;

-- para ver el status de rentas de peliculas select dni_socio,nombre_completo,titulo,fecha_renta,fecha_devolucion from socio inner join renta_pelicula on socio_renta = dni_socio inner join peliculas on peli_rentada = idpeliculas;

-- consulte a la tabla peliculas para ver cuantas estan disponibles y cuantas rentadas select * from peliculas;