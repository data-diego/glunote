import 'package:flutter/material.dart';
import 'package:glunote/src/pages/ajustes/ajustes.dart';
import 'package:glunote/src/pages/comienzo/login_page.dart';
import 'package:glunote/src/pages/comienzo/registrar_page.dart';
import 'package:glunote/src/pages/comienzo/start_page.dart';
import 'package:glunote/src/pages/error.dart';
import 'package:glunote/src/pages/inicio/inicio.dart';
import 'package:glunote/src/pages/registro/anotado.dart';
import 'package:glunote/src/pages/registro/bienestar/bienestar.dart';
import 'package:glunote/src/pages/registro/bienestar/bienestar_a.dart';
import 'package:glunote/src/pages/registro/bienestar/bienestar_b.dart';
import 'package:glunote/src/pages/registro/bienestar/bienestar_c.dart';
import 'package:glunote/src/pages/registro/bienestar/bienestar_d.dart';
import 'package:glunote/src/pages/registro/bienestar/bienestar_e.dart';
import 'package:glunote/src/pages/registro/comida/comida.dart';
import 'package:glunote/src/pages/registro/comida/comida_respuesta.dart';
import 'package:glunote/src/pages/registro/ejercicio/ejercicio.dart';
import 'package:glunote/src/pages/registro/glicemia/glicemia_comida.dart';
import 'package:glunote/src/pages/registro/glicemia/glicemia.dart';
import 'package:glunote/src/pages/registro/glicemia/glicemia_respuesta.dart';
import 'package:glunote/src/pages/registro/insulina.dart';
import 'package:glunote/src/pages/registro/registro_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => StartPage(),
    'login': (BuildContext context) => LoginPage(),
    'registrar': (BuildContext context) => RegistrarPage(),
    'error': (BuildContext context) => ErrorPage(),
    'inicio': (BuildContext context) => InicioPage(),
    'ajustes': (BuildContext context) => AjustesPage(),
    'registro': (BuildContext context) => RegistroPage(),
    'anotado': (BuildContext context) => AnotadoPage(),
    'ejercicio': (BuildContext context) => EjercicioPage(),
    'bienestar': (BuildContext context) => BienestarPage(),
    'bienestar_a': (BuildContext context) => BienestarAPage(),
    'bienestar_b': (BuildContext context) => BienestarBPage(),
    'bienestar_c': (BuildContext context) => BienestarCPage(),
    'bienestar_d': (BuildContext context) => BienestarDPage(),
    'bienestar_e': (BuildContext context) => BienestarEPage(),
    'comida': (BuildContext context) => ComidaPage(),
    'comida_respuesta': (BuildContext context) => ComidaRespuestaPage(),
    'glicemia_comida': (BuildContext context) => GlicemiaComidaPage(),
    'glicemia': (BuildContext context) => GlicemiaPage(),
    'glicemia_respuesta': (BuildContext context) => GlicemiaRespuestaPage(),
    'insulina': (BuildContext context) => InsulinaPage(),
  };
}
