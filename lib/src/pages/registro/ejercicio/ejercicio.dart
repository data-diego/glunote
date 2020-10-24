import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/glunote_icons.dart';
import 'package:glunote/src/utils/utils.dart';
import 'package:glunote/src/widgets/principal_widget.dart';

class EjercicioPage extends StatefulWidget {
  @override
  EjercicioPageState createState() => EjercicioPageState();
}

class EjercicioPageState extends State<EjercicioPage> {
  final prefs = PreferenciasUsuario();
  TextEditingController _inputFieldController = TextEditingController();
  PageController _controller = PageController();
  double _valorSlider = 60.0;
  bool _alarma1 = false;
  bool _alarma2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bNav(context, 1),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              SingleChildScrollView(child: _pagina(context), reverse: true),
              SingleChildScrollView(child: _pagina1(context), reverse: true),
              SingleChildScrollView(child: _pagina2(context), reverse: true),
              SingleChildScrollView(child: _pagina3(context), reverse: true),
            ]));
  }

  Widget _pagina3(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.099,
          vertical: screenHeight(context) * 0.052),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          gMensaje(
              'Para que tu plan de ejercicio funcione bien sigue estos consejos:'),
          SizedBox(height: 25.0),
          tarjeta2(context),
          SwitchListTile(
            activeColor: Colors.indigoAccent[200],
            inactiveThumbColor: Colors.indigoAccent[200],
            title: Text('Fijar alarma para medir glucemia',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigoAccent[200])),
            value: _alarma1,
            onChanged: (valor) {
              _alarma1 = valor;
            },
          ),
          SwitchListTile(
            activeColor: Colors.indigoAccent[200],
            inactiveThumbColor: Colors.indigoAccent[200],
            title: Text('Notificar a contacto de ayuda',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigoAccent[200])),
            value: _alarma2,
            onChanged: (valor) {
              _alarma2 = valor;
            },
          ),
          OutlineButton(
            onPressed: () {},
            child: Text(
              '¿Por qué debo esperar?',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              prevBtn(context,
                  prev: 'pageView',
                  controller: _controller,
                  color: Colors.indigoAccent[200]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.099,
          vertical: screenHeight(context) * 0.052),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          gMensaje('¿Cuántos minutos durará la rutina?'),
          SizedBox(height: 60.0),
          Slider(
            activeColor: Colors.indigoAccent[200],
            value: _valorSlider,
            divisions: 10,
            label: "${_valorSlider.toStringAsFixed(0)}",
            min: 30.0,
            max: 180.0,
            onChanged: (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('30'),
              Text('180'),
            ],
          ),
          SizedBox(height: 12),
          Text('${_valorSlider.toStringAsFixed(0)}',
              style: TextStyle(
                  color: Colors.indigoAccent[200],
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              prevBtn(context,
                  prev: 'pageView',
                  controller: _controller,
                  color: Colors.indigoAccent[200]),
              SizedBox(width: screenWidth(context) * 0.2),
              nextBtn(context, 'pageView',
                  controller: _controller, color: Colors.indigoAccent[200])
            ],
          ),
        ],
      ),
    );
  }

  Widget _pagina1(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.099,
          vertical: screenHeight(context) * 0.052),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          gMensaje(
              'Súper! Siempre es bueno probar un plan propio de ejercicio'),
          SizedBox(height: 25.0),
          RaisedButton(
            color: Colors.indigoAccent[200],
            elevation: 0,
            onPressed: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn);
            },
            child: Text(
              'Ejercicio aeróbico',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          RaisedButton(
            color: Colors.indigoAccent[200],
            elevation: 0,
            onPressed: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn);
            },
            child: Text(
              'Ejercicio anaeróbico',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          RaisedButton(
            color: Colors.indigoAccent[200],
            elevation: 0,
            onPressed: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn);
            },
            child: Text(
              'Ejercicio mixto',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          SizedBox(height: 15),
          OutlineButton(
            onPressed: () {},
            child: Text(
              '¿Qué significa esto?',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              prevBtn(context,
                  prev: 'pageView',
                  controller: _controller,
                  color: Colors.indigoAccent[200]),
              SizedBox(width: screenWidth(context) * 0.2),
              nextBtn(context, 'pageView',
                  controller: _controller, color: Colors.indigoAccent[200])
            ],
          ),
        ],
      ),
    );
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
              prevBtn(context, color: Colors.indigoAccent[200]),
              SizedBox(width: screenWidth(context) * 0.2),
              (prefs.glicemia <= 70)
                  ? nextBtn(context, 'glicemia_respuesta',
                      color: Colors.indigoAccent[200])
                  : nextBtn(context, 'pageView',
                      controller: _controller, color: Colors.indigoAccent[200])
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
            borderSide:
                BorderSide(color: Colors.indigoAccent[200], width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.indigoAccent[200])),
        hintText: 'De esta última hora',
        labelText: 'Glicemia',
        isDense: true,
        suffixText: 'mg/dL',
        suffixStyle: TextStyle(
            color: Colors.indigoAccent[200], fontWeight: FontWeight.w600),
      ),
      onChanged: (valor) {
        setState(() {
          prefs.glicemia = double.parse(valor);
        });
      },
    );
  }

  Widget tarjeta2(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color.fromRGBO(184, 198, 255, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Glunote.ejercicio,
                color: Colors.indigoAccent[200],
              ),
              title: Text(
                'Ejercicio aeróbico',
                style: TextStyle(
                    color: Colors.indigoAccent[200],
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text('Comer 40 gramos de carbohidratos'),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text('Medir nivel de glucemia cada 30 min'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'comida');
                  },
                  child: Text(
                    'Usaré otra dosis',
                    style: TextStyle(
                      color: Colors.indigoAccent[200],
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'anotado');
                  },
                  child: Text(
                    'Acepto',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  color: Colors.indigoAccent[200],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
