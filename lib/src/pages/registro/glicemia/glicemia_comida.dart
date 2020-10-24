import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class GlicemiaComidaPage extends StatefulWidget {
  @override
  GlicemiaComidaPageState createState() => GlicemiaComidaPageState();
}

class GlicemiaComidaPageState extends State<GlicemiaComidaPage> {
  final prefs = new PreferenciasUsuario();
  TextEditingController _inputFieldController = new TextEditingController();
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 1),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              SingleChildScrollView(child: _pagina(context), reverse: true),
            ]));
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
          gMensaje('¿Cuál es tu nivel de glicemia?'),
          SizedBox(height: 25.0),
          _crearInput(),
          SizedBox(height: 45.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              prevBtn(context),
              SizedBox(width: screenWidth(context) * 0.2),
              (prefs.glicemia <= 70)
                  ? nextBtn(context, 'glicemia_respuesta')
                  : nextBtn(context, 'comida')
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      controller: _inputFieldController,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      // autofocus: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.redAccent[400], width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.redAccent[400])),
        hintText: 'De esta última hora',
        labelText: 'Glicemia',
        isDense: true,
        suffixText: 'mg/dL',
        suffixStyle: TextStyle(
            color: Colors.redAccent[400], fontWeight: FontWeight.w600),
      ),
      onChanged: (valor) {
        setState(() {
          prefs.glicemia = double.parse(valor);
        });
      },
    );
  }
}
