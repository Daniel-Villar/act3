import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.idProducto,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.precioMayoreo,
    required this.stack,
    required this.demanda,
    required this.idSucursal,
  }) : super(key: key);

  final String idProducto;
  final String nombre;
  final String precio;
  final String descripcion;
  final String precioMayoreo;
  final String stack;
  final String demanda;
  final String idSucursal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detalles del Producto"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailTile("ID Producto", idProducto, Icons.numbers),
            _buildDetailTile("Nombre", nombre, Icons.shopping_bag),
            _buildDetailTile("Precio", "\$$precio", Icons.attach_money),
            _buildDetailTile("Descripción", descripcion, Icons.description),
            _buildDetailTile("Precio Mayoreo", "\$$precioMayoreo", Icons.money),
            _buildDetailTile("Stock", stack, Icons.inventory),
            _buildDetailTile("Demanda", demanda, Icons.trending_up),
            _buildDetailTile("ID Sucursal", idSucursal, Icons.store),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple.shade300),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value.isNotEmpty ? value : "No especificado"),
        trailing: const Icon(Icons.info, color: Colors.grey),
      ),
    );
  }
}