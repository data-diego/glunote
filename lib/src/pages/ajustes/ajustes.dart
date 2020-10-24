import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class AjustesPage extends StatefulWidget {
  @override
  _AjustesPageState createState() => _AjustesPageState();
}

class _AjustesPageState extends State<AjustesPage> {
  final prefs = new PreferenciasUsuario();
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 2),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              SingleChildScrollView(
                child: _pagina2(context),
                reverse: true,
              )
            ]));
  }

  Widget _pagina2(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gMensaje(
                  'Aquí puedes cambiar tu Ratio, Sensibilidad y Glucemia objetivo.'),
              SizedBox(
                height: 21.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 2.0,
                          borderRadius: BorderRadius.circular(30.0)),
                      isDense: true,
                      labelText: 'Ratio',
                      hintText: prefs.ratio.toString()),
                  onChanged: (valor) {
                    setState(() {
                      prefs.ratio = double.parse(valor);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 2.0,
                          borderRadius: BorderRadius.circular(30.0)),
                      isDense: true,
                      labelText: 'Sensibilidad',
                      hintText: prefs.sensibilidad.toString()),
                  onChanged: (valor) {
                    setState(() {
                      prefs.sensibilidad = double.parse(valor);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 2.0,
                          borderRadius: BorderRadius.circular(30.0)),
                      isDense: true,
                      labelText: 'Gluciemia Objetivo',
                      hintText: prefs.glicemiaObjetivo.toString()),
                  onChanged: (valor) {
                    setState(() {
                      prefs.glicemiaObjetivo = double.parse(valor);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              doneBtn(context)
            ]),
      ),
    );
  }
}
