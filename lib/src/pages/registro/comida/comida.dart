import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class ComidaPage extends StatefulWidget {
  @override
  _ComidaPageState createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  final prefs = new PreferenciasUsuario();
  List<String> _opciones = ['Normal', 'Fritos/Alto en grasas'];
  TextEditingController _inputFieldController = new TextEditingController();
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 1),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              SingleChildScrollView(child: _pagina1(context), reverse: true),
            ]));
  }

  Widget _pagina1(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.032),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            gMensaje('¿Cuántos gramos de carbohidratos vas a comer?'),
            SizedBox(height: 25.0),
            _crearInput(),
            SizedBox(height: 5.0),
            DropdownButton(
              value: prefs.opcion,
              items: getOpcionesDD(),
              onChanged: (opt) {
                setState(() {
                  prefs.opcion = opt;
                });
              },
            ),
            SizedBox(height: 5.0),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Ver listado de comidas',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              color: Colors.redAccent[200],
              textColor: Colors.white,
              shape: StadiumBorder(),
            ),
            SizedBox(height: 5.0),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Usar tarjeta inteligente de comida',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              color: Colors.redAccent[200],
              textColor: Colors.white,
              shape: StadiumBorder(),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                prevBtn(context),
                SizedBox(width: screenWidth(context) * 0.2),
                nextBtn(context, 'comida_respuesta')
              ],
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDD() {
    List<DropdownMenuItem<String>> lista = new List();
    _opciones.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
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
            borderSide: BorderSide(color: Colors.redAccent[200], width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.redAccent[200])),
        hintText: 'Basta con aproximarlo',
        labelText: 'Carbohidratos',
        isDense: true,
        suffixText: 'gr',
        suffixStyle: TextStyle(
            color: Colors.redAccent[200], fontWeight: FontWeight.w600),
      ),
      onChanged: (valor) {
        setState(() {
          prefs.carbs = double.parse(valor);
        });
      },
    );
  }
}
