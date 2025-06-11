import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idProductoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioMayoreoController = TextEditingController();
  final _stackController = TextEditingController();
  final _demandaController = TextEditingController();
  final _idSucursalController = TextEditingController();

  @override
  void dispose() {
    _idProductoController.dispose();
    _nombreController.dispose();
    _precioController.dispose();
    _descripcionController.dispose();
    _precioMayoreoController.dispose();
    _stackController.dispose();
    _demandaController.dispose();
    _idSucursalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Formulario de Producto"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _idProductoController,
              fieldName: "ID Producto",
              myIcon: Icons.numbers,
              prefixIconColor: Colors.deepPurple.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre",
              myIcon: Icons.shopping_bag,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _precioController,
              fieldName: "Precio",
              myIcon: Icons.attach_money,
              prefixIconColor: Colors.deepPurple.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _descripcionController,
              fieldName: "Descripción",
              myIcon: Icons.description,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _precioMayoreoController,
              fieldName: "Precio Mayoreo",
              myIcon: Icons.money,
              prefixIconColor: Colors.deepPurple.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _stackController,
              fieldName: "Stock",
              myIcon: Icons.inventory,
              prefixIconColor: Colors.deepPurple.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _demandaController,
              fieldName: "Demanda",
              myIcon: Icons.trending_up,
              prefixIconColor: Colors.deepPurple.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _idSucursalController,
              fieldName: "ID Sucursal",
              myIcon: Icons.store,
              prefixIconColor: Colors.deepPurple.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              idProducto: _idProductoController.text,
              nombre: _nombreController.text,
              precio: _precioController.text,
              descripcion: _descripcionController.text,
              precioMayoreo: _precioMayoreoController.text,
              stack: _stackController.text,
              demanda: _demandaController.text,
              idSucursal: _idSucursalController.text,
            );
          }),
        );
      },
      child: Text(
        "Enviar Formulario".toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}