import 'package:flutter/material.dart';
import 'package:glunote/src/utils/glunote_icons.dart';

Widget imensaje(BuildContext context, String texto) {
  final estiloTexto = TextStyle(color: Colors.black, fontSize: 18.0);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Icon(
        Glunote.glunote,
        color: Colors.redAccent,
        size: 20.0,
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        texto,
        style: estiloTexto,
      )
    ],
  );
}

Widget prevBtn(BuildContext context,
    {String prev, PageController controller, Color color = Colors.redAccent}) {
  return FloatingActionButton(
    heroTag: prev,
    mini: true,
    elevation: 0.0,
    onPressed: () {
      if (prev == 'pageView') {
        controller.previousPage(
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      } else {
        Navigator.pop(context);
      }
    },
    child: Icon(Glunote.flecha_izqicono_glunote),
    backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
    foregroundColor: color,
    shape: CircleBorder(side: BorderSide(color: color, width: 2.0)),
  );
}

Widget nextBtn(BuildContext context, String next,
    {Color color = Colors.redAccent, PageController controller}) {
  return FloatingActionButton(
    heroTag: 'next',
    mini: true,
    elevation: 0.0,
    onPressed: () {
      if (next == 'pageView') {
        controller.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      } else {
        Navigator.pushNamed(context, next);
      }
    },
    child: Icon(Glunote.flecha_dericono_glunote),
    backgroundColor: color,
  );
}

Widget doneBtn(BuildContext context, {Color color = Colors.redAccent}) {
  return FloatingActionButton(
    heroTag: 'nexta',
    mini: true,
    elevation: 0.0,
    onPressed: () {
      Navigator.of(context).pushReplacementNamed('registro');
    },
    child: Icon(Icons.done),
    backgroundColor: color,
  );
}

Widget btns(BuildContext context, String next, Color color, IconData icono) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    FloatingActionButton(
      heroTag: 'back',
      mini: true,
      elevation: 0.0,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Glunote.flecha_izqicono_glunote),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      foregroundColor: color,
      shape: CircleBorder(side: BorderSide(color: color, width: 2.0)),
    ),
    SizedBox(
      width: 72.0,
    ),
    FloatingActionButton(
      heroTag: 'nexto',
      mini: true,
      elevation: 0.0,
      onPressed: () {
        Navigator.pushNamed(context, next);
      },
      child: Icon(icono),
      backgroundColor: color,
    ),
  ]);
}

Widget bNav(BuildContext context, int _curIndex) {
  return BottomNavigationBar(
    currentIndex: _curIndex,
    onTap: (index) {
      _curIndex = index;
      switch (_curIndex) {
        case 0:
          Navigator.pushReplacementNamed(context, 'inicio');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, 'registro');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, 'ajustes');
          break;
      }
    },
    items: [
      BottomNavigationBarItem(
          icon: Icon(Glunote.inicio_relleno), title: Text('Inicio')),
      BottomNavigationBarItem(
          icon: Icon(Glunote.glucemia), title: Text('Registro')),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text('Ajustes')),
    ],
  );
}
