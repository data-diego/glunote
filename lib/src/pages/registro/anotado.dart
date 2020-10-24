import 'package:flutter/material.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class AnotadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 1),
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * 0.099,
                vertical: screenHeight(context) * 0.052),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                gMensaje('Ok! anotado.'),
                SizedBox(height: 12.0),
                doneBtn(context)
              ],
            )));
  }
}
