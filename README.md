# Base de Datos de Cine

Este proyecto es una base de datos SQL diseñada para gestionar la información básica de un cine, como boletos, comidas, asientos, funciones, películas y más. Incluye el archivo SQL para crear la base de datos, un modelo UML y un diagrama simplificado en PDF.

---

## Estructura del Proyecto

- **`BDfinal.sql`**: Archivo SQL que contiene el esquema de la base de datos y las consultas necesarias para su creación.
- **`DATAPLUSIVEFINAL.astah`**: Modelo UML creado con Astah UML que describe la estructura de la base de datos.
- **`MiniModel.pdf`**: Diagrama simplificado que muestra las tablas y relaciones principales de la base de datos.
- **`README.md`**: Este archivo, que proporciona una descripción del proyecto.

---

## Requisitos

- Un servidor SQL (MySQL, PostgreSQL, SQL Server, etc.).
- Herramientas para ejecutar archivos SQL (como MySQL Workbench, pgAdmin, etc.).
- [Astah UML](https://astah.net/) para abrir y editar el archivo `DATAPLUSIVEFINAL.astah`.
- Un visor de PDF para abrir `MiniModel.pdf`.

---

## Instalación

1. Clona este repositorio o descarga los archivos.
2. Abre tu servidor SQL y crea una nueva base de datos.
3. Ejecuta el archivo `BDfinal.sql` en tu servidor para crear las tablas y relaciones.
4. Revisa el archivo `DATAPLUSIVEFINAL.astah` con Astah UML para entender la estructura completa de la base de datos.
5. Consulta el archivo `MiniModel.pdf` para obtener una vista simplificada de las tablas y relaciones.

---

## Estructura de la Base de Datos

La base de datos está diseñada para gestionar la información de un cine, incluyendo:

- **Películas**: Información sobre las películas disponibles.
- **Funciones**: Horarios y salas de las proyecciones.
- **Asientos**: Disponibilidad y ubicación de los asientos.
- **Boletos**: Registro de boletos vendidos.
- **Comidas**: Productos disponibles en la dulcería.
- **Clientes**: Información de los clientes del cine.
- **Empleados**: Datos de los empleados que trabajan en el cine.
- **Compras**: Registro de transacciones de compra.
- **Proveedores**: Información de los proveedores de productos.
- **Reseñas**: Opiniones y puntuaciones de las películas.
- **Opiniones del Cine**: Comentarios generales sobre la experiencia en el cine.

### Recursos Adicionales
- **`DATAPLUSIVEFINAL.astah`**: Modelo UML detallado creado con Astah UML.
- **`MiniModel.pdf`**: Diagrama simplificado de las tablas y relaciones principales.

---

## Uso

Una vez que la base de datos esté configurada, puedes realizar consultas SQL para:

- Registrar nuevas películas, funciones, asientos y boletos.
- Consultar la disponibilidad de asientos para una función.
- Gestionar las ventas de comidas y boletos.
- Generar reportes de ventas o asistencia.

Ejemplo de consulta:
```sql
SELECT * FROM Peliculas WHERE CategoriaEdad = 'PG-13';
