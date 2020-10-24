import 'package:flutter/material.dart';
import 'package:glunote/src/bloc/provider.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/routes/routes.dart';
import 'package:flutter/services.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Color.fromRGBO(255, 23, 68, 1)));
    return Provider(
      child: MaterialApp(
        title: 'Glunote',
        initialRoute: 'registro',
        routes: getAppRoutes(),
        theme: ThemeData(
            fontFamily: 'Lato',
            primaryColor: Colors.redAccent,
            scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
            buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                buttonColor: Color.fromRGBO(255, 23, 68, 1.0),
                shape: StadiumBorder())),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
