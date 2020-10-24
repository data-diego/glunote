import 'package:flutter/material.dart';
import 'package:glunote/src/utils/glunote_icons.dart';

final estiloTexto = TextStyle(color: Colors.black, fontSize: 16.0);
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

Widget gMensaje(String mensaje) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Glunote.glunote,
          color: Colors.redAccent,
        ),
        SizedBox(
          height: 15.0,
          width: double.infinity,
        ),
        Text(
          mensaje,
          style: estiloTexto,
        ),
      ]);
}

bool isNumeric(String s) {
  if (s.isEmpty) return false;
  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Ups!'),
          content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.redAccent,
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
