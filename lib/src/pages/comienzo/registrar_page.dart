import 'package:flutter/material.dart';
import 'package:glunote/src/bloc/provider.dart';
import 'package:glunote/src/providers/usuario_provider.dart';
import 'package:glunote/src/utils/utils.dart';

class RegistrarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) * 0.108,
              vertical: screenHeight(context) * 0.052),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(height: screenHeight(context) * 0.25),
              gMensaje(
                  'Super! Solo una cosa más.\nPara usar Glunote y no perder tu información, debes crearte un usuario.'),
              SizedBox(height: 30.0),
              _crearEmail(bloc),
              SizedBox(height: 15.0),
              _crearPassword(bloc),
              SizedBox(height: 30.0),
              _crearBoton(bloc),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              hintText: 'ejemplo@gmail.com',
              labelText: 'Correo Electrónico',
              errorText: snapshot.error,
            ),
            onChanged: (value) => bloc.changeEmail(value),
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              labelText: 'Contraseña',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }
}

Widget _crearBoton(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Crear cuenta'),
          ),
          elevation: 0.0,
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
    },
  );
}

_login(LoginBloc bloc, BuildContext context) async {
  final usuarioProvider = new UsuarioProvider();
  Map info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
  if (info['ok']) {
    Navigator.pushReplacementNamed(context, 'registrar');
  } else {
    mostrarAlerta(context, info['mensaje']);
  }
}
