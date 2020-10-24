import 'package:flutter/material.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/glunote_icons.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final prefs = new PreferenciasUsuario();
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 1),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              SingleChildScrollView(
                child: _pagina1(context),
                reverse: true,
              )
            ]));
  }

  Widget _pagina1(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Registro',
                style: TextStyle(fontSize: 31, fontWeight: FontWeight.w900)),
            SizedBox(height: screenHeight(context) * 0.45),
            gMensaje(
                '¡Qué bueno verte ${prefs.nombre}! \n ¿Qué deseas registrar?'),
            SizedBox(height: 36.0),
            _botones(context),
          ],
        ),
      ),
    );
  }

  Widget _botones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _botexto(context, Glunote.comida, 'Comida', 'glicemia_comida',
            Colors.redAccent[200]),
        _botexto(context, Glunote.glucemia, 'Nivel de Glicemia', 'glicemia',
            Colors.redAccent[400]),
        _botexto(context, Glunote.ejercicio, 'Ejercicio', 'ejercicio',
            Colors.indigoAccent[200]),
        _botexto(context, Glunote.bienestar, 'Bienestar', 'bienestar',
            Colors.pink[400]),
      ],
    );
  }
}

Widget _botexto(
  BuildContext context,
  IconData icono,
  String texto,
  String ruta,
  Color color,
) {
  return Column(
    children: <Widget>[
      Transform.scale(
        scale: 0.8,
        child: FloatingActionButton(
          heroTag: ruta,
          elevation: 0.0,
          onPressed: () {
            Navigator.pushNamed(context, ruta);
          },
          child: Icon(icono),
          backgroundColor: color,
        ),
      ),
      SizedBox(height: 3.3),
      SizedBox(
        width: 54,
        height: 30,
        child: Center(
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 12.5),
          ),
        ),
      )
    ],
  );
}
