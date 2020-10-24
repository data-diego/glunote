import 'package:flutter/material.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bNav(context, 0),
      body: Center(
        child: RaisedButton(
          elevation: 0,
          child: Text('Ir a la página de bienvenida.'),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ),
    );
  }
}
