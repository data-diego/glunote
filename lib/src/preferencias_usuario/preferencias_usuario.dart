import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  // GET y SET del nombre
  get nombre {
    return _prefs.getString('nombre') ?? 'Usuario Nuevo';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  // GET y SET de la ratio
  get ratio {
    return _prefs.getDouble('ratio') ?? 15;
  }

  set ratio(double value) {
    _prefs.setDouble('ratio', value);
  }

  // GET y SET de la sensibilidad
  get sensibilidad {
    return _prefs.getDouble('sensibilidad') ?? 50;
  }

  set sensibilidad(double value) {
    _prefs.setDouble('sensibilidad', value);
  }

  // GET y SET de la glicemiaObjetivo
  get glicemiaObjetivo {
    return _prefs.getDouble('glicemiaObjetivo') ?? 100;
  }

  set glicemiaObjetivo(double value) {
    _prefs.setDouble('glicemiaObjetivo', value);
  }

  // GET y SET de la glicemia
  get glicemia {
    return _prefs.getDouble('glicemia') ?? 100;
  }

  set glicemia(double value) {
    _prefs.setDouble('glicemia', value);
  }

  // GET y SET de la insulina
  get insulina {
    return _prefs.getDouble('insulina') ?? 2;
  }

  set insulina(double value) {
    _prefs.setDouble('insulina', value);
  }

  // GET y SET de los carbohidratos
  get carbs {
    return _prefs.getDouble('carbs') ?? 40;
  }

  set carbs(double value) {
    _prefs.setDouble('carbs', value);
  }

  // GET y SET de la opcion comida
  get opcion {
    return _prefs.getString('opcion') ?? 'Normal';
  }

  set opcion(String value) {
    _prefs.setString('opcion', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
