import 'package:flutter/material.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/glunote_icons.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class ComidaRespuestaPage extends StatefulWidget {
  @override
  _ComidaRespuestaPageState createState() => _ComidaRespuestaPageState();
}

class _ComidaRespuestaPageState extends State<ComidaRespuestaPage> {
  final prefs = new PreferenciasUsuario();
  bool _alarma1 = false;
  bool _alarma2 = false;
  double _espera;
  double _dosis;
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    _espera = ((prefs.glicemia - 80) / 10);
    _dosis = (((prefs.glicemia - prefs.glicemiaObjetivo) / prefs.sensibilidad) +
        (prefs.carbs / prefs.ratio));
    if (prefs.opcion == 'Fritos/Alto en grasas') {
      _dosis = (_dosis * 1.3);
    }
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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: (prefs.opcion == 'Fritos/Alto en grasas')
            ? _fritos(context)
            : _normal(context),
      ),
    );
  }

  Widget _normal(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        gMensaje(
            'A la orden! Aplica la dosis de insulina y espera los minutos indicados antes de comer.'),
        SizedBox(height: 15.0),
        tarjeta(context),
        SwitchListTile(
          activeColor: Colors.redAccent[200],
          inactiveThumbColor: Colors.redAccent[200],
          title: Text('Fijar alarma para comer',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.redAccent[200])),
          value: _alarma1,
          onChanged: (valor) {
            _alarma1 = valor;
          },
        ),
        OutlineButton(
          onPressed: () {},
          child: Text(
            '¿Por qué debo esperar?',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            prevBtn(context),
          ],
        ),
      ],
    );
  }

  Widget _fritos(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        gMensaje('Atento! Tu comida tiene alto contenido de grasa.'),
        SizedBox(height: 12.0),
        tarjeta2(context),
        SwitchListTile(
          activeColor: Colors.redAccent[200],
          inactiveThumbColor: Colors.redAccent[200],
          title: Text('Fijar alarma para comer',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.redAccent[200])),
          value: _alarma1,
          onChanged: (valor) {
            _alarma1 = valor;
          },
        ),
        SwitchListTile(
          activeColor: Colors.redAccent[200],
          inactiveThumbColor: Colors.redAccent[200],
          title: Text('Fijar alarma Split Bolo',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.redAccent[200])),
          value: _alarma2,
          onChanged: (valor) {
            _alarma2 = valor;
          },
        ),
        OutlineButton(
          onPressed: () {},
          child: Text(
            '¿Por qué debo esperar?',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[prevBtn(context)],
        ),
      ],
    );
  }

  Widget tarjeta(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.red[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
                'Bolo Normal',
                style: TextStyle(
                    color: Colors.redAccent[200],
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text(
                  'Aplica una dosis de ${_dosis.toStringAsFixed(0)}U de insulina'),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text('Espera ${_espera.round()} minutos para comer'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'insulina');
                  },
                  child: Text(
                    'Usaré otra dosis',
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
    );
  }

  Widget tarjeta2(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.red[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.all(5.0),
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
                'Split Bolo',
                style: TextStyle(
                    color: Colors.redAccent[200],
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text(
                  'Aplica una dosis de ${(_dosis * 0.6).toStringAsFixed(0)}U de insulina'),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text('Espera ${_espera.round()} minutos para comer'),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text(
                  'Aplica una dosis de ${(_dosis * 0.4).toStringAsFixed(0)}U de insulina en 2 horas'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'insulina');
                  },
                  child: Text(
                    'Usaré otra dosis',
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
    );
  }
}
