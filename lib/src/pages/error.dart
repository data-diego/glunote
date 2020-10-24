import 'package:flutter/material.dart';
import 'package:glunote/src/utils/utils.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _pagina(context),
    );
  }

  Widget _pagina(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gMensaje('Algo salió mal...'),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  Navigator.pushNamed(context, 'registro');
                },
                child: Text(
                  'Volver al registro',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ]),
      ),
    );
  }
}
