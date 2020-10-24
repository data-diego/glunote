import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class InsulinaPage extends StatefulWidget {
  @override
  InsulinaPageState createState() => InsulinaPageState();
}

class InsulinaPageState extends State<InsulinaPage> {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 1), body: _pagina(context));
  }

  Widget _pagina(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.099,
          vertical: screenHeight(context) * 0.052),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          gMensaje('¿Qué dosis de insulina te vas a aplicar?'),
          SizedBox(height: 25.0),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 90.0),
              child: _crearInput()),
          SizedBox(height: 45.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              prevBtn(context, color: Colors.deepPurpleAccent[200]),
              SizedBox(width: screenWidth(context) * 0.2),
              nextBtn(context, 'anotado', color: Colors.deepPurpleAccent[200])
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      // autofocus: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide:
                BorderSide(color: Colors.deepPurpleAccent[200], width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.deepPurpleAccent[200])),
        labelText: 'Insulina',
        isDense: true,
        suffixText: 'U',
        suffixStyle: TextStyle(
            color: Colors.deepPurpleAccent[200], fontWeight: FontWeight.w600),
      ),
      onChanged: (valor) {
        setState(() {
          prefs.insulina = double.parse(valor);
        });
      },
    );
  }
}
