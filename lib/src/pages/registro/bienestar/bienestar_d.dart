import 'package:flutter/material.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class BienestarDPage extends StatefulWidget {
  @override
  BienestarDPageState createState() => BienestarDPageState();
}

class BienestarDPageState extends State<BienestarDPage> {
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
              SingleChildScrollView(child: _pagina1(context), reverse: true),
            ]));
  }

  Widget _pagina1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.099,
          vertical: screenHeight(context) * 0.052),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          gMensaje('¿Por qué te sientes mal?'),
          SizedBox(height: 25.0),
          RaisedButton(
            color: Colors.pink,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'anotado');
            },
            child: Text(
              'Tengo resfriado',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'anotado');
            },
            child: Text(
              'Mi glucemia anduvo mal',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'anotado');
            },
            child: Text(
              'Tratar la Diabetes me disgusta',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'anotado');
            },
            child: Text(
              'Tengo estrés',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'anotado');
            },
            child: Text(
              'Solo fue un mal día',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          SizedBox(height: 15),
          OutlineButton(
            onPressed: () {},
            child: Text(
              'Prefiero escribir lo que siento',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            borderSide: BorderSide(color: Colors.pink),
            textColor: Colors.pink,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              prevBtn(context, color: Colors.pink),
              SizedBox(width: screenWidth(context) * 0.2),
              doneBtn(context, color: Colors.pink)
            ],
          ),
        ],
      ),
    );
  }
}
