import 'package:flutter/material.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/glunote_icons.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class BienestarPage extends StatefulWidget {
  @override
  _BienestarPageState createState() => _BienestarPageState();
}

class _BienestarPageState extends State<BienestarPage> {
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
            gMensaje(
                '¿Cómo te has sentido hoy? Selecciona la carita que lo refleje.'),
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
        _botexto(context, Glunote.bienestar_a, 'Increíble!', 'bienestar_a'),
        _botexto(context, Glunote.bienestar_b, 'Bien', 'bienestar_b'),
        _botexto(context, Glunote.bienestar_c, 'Agotado', 'bienestar_c'),
        _botexto(context, Glunote.bienestar_d, 'Mal', 'bienestar_d'),
        _botexto(context, Glunote.bienestar_e, 'Estresado', 'bienestar_e'),
      ],
    );
  }
}

Widget _botexto(
    BuildContext context, IconData icono, String texto, String ruta) {
  return Column(
    children: <Widget>[
      Transform.scale(
        scale: 0.8,
        child: FloatingActionButton(
          heroTag: texto,
          elevation: 0.0,
          onPressed: () {
            Navigator.pushNamed(context, ruta);
          },
          child: Icon(icono),
          backgroundColor: Colors.pink,
        ),
      ),
      SizedBox(height: 3.3),
      Center(
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 12.5),
        ),
      ),
    ],
  );
}
