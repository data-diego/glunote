import 'package:flutter/material.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/glunote_icons.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class GlicemiaRespuestaPage extends StatelessWidget {
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
                child: _pagina(context),
                reverse: true,
              )
            ]));
  }

  Widget _pagina(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.099,
          vertical: screenHeight(context) * 0.052),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          (prefs.glicemia <= 70)
              ? gMensaje(
                  'Tu nivel de glucemia está bajo. Haz esto lo más pronto posible: ')
              : (prefs.glicemia > 120)
                  ? gMensaje(
                      'Ups! tu nivel de glucemia está alto. Prueba este consejo para  solucionarlo:')
                  : gMensaje('¡Qué bien! Estás en rango.'),
          SizedBox(height: 21.0),
          (prefs.glicemia <= 70)
              ? _comer(context)
              : (prefs.glicemia > 120) ? _corregir(context) : doneBtn(context),
        ],
      ),
    );
  }

  Widget _corregir(BuildContext context) {
    double _correccion =
        ((prefs.glicemia - prefs.glicemiaObjetivo) / prefs.sensibilidad);
    return Column(
      children: <Widget>[
        Card(
          elevation: 0,
          color: Colors.deepPurple[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Glunote.insulina,
                    color: Colors.deepPurpleAccent[200],
                  ),
                  title: Text(
                    'Corregir el nivel de glucemia',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent[200],
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.done),
                  title: Text(
                      'Aplica una dosis de ${_correccion.round()}U de insulina'),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'insulina');
                      },
                      child: Text(
                        'Usaré otra dosis',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent[200],
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'anotado');
                      },
                      child: Text(
                        'Acepto',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      color: Colors.deepPurpleAccent[200],
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 21.0),
        OutlineButton(
          onPressed: () {},
          child: Text(
            '¿Por qué me pasó esto?',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[prevBtn(context)],
        )
      ],
    );
  }

  Widget _comer(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 0,
          color: Colors.red[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Glunote.comida,
                    color: Colors.redAccent[200],
                  ),
                  title: Text(
                    'Comer 15 gramos de carbohidratos',
                    style: TextStyle(
                        color: Colors.redAccent[200],
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.done),
                  title: Text('Deben ser líquidos (jugo o bebida azucarada)'),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'comida');
                      },
                      child: Text(
                        'Comeré otra cosa',
                        style: TextStyle(
                          color: Colors.redAccent[200],
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'anotado');
                      },
                      child: Text(
                        'Acepto',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      color: Colors.redAccent[200],
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 21.0),
        OutlineButton(
          onPressed: () {},
          child: Text(
            '¿Por qué me pasó esto?',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[prevBtn(context)],
        )
      ],
    );
  }
}
