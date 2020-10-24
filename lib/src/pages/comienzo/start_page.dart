import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glunote/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:glunote/src/utils/utils.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = new PageController();
  double _valorSlider = 6.0;
  double _valorSlider2 = 100.0;
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: bNav(context, 0),
        body: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: <Widget>[
        SingleChildScrollView(
          child: _pagina1(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina2(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina3(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina4(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina5(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina6(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina7(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina8(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina9(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina10(context),
          reverse: true,
        ),
        SingleChildScrollView(
          child: _pagina11(context),
          reverse: true,
        )
      ],
    ));
  }

  Widget _pagina1(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                textColor: Colors.redAccent,
                child: Text('Saltarse la bienvenida.'),
                onPressed: () => Navigator.pushNamed(context, 'registro'),
              ),
              SizedBox(
                height: 450,
              ),
              gMensaje(
                  'Hola! Soy tu asistente personal para el manejo de la diabetes. ¿Podrías responderme algunas preguntas?'),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Vamos!',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              FlatButton(
                textColor: Colors.redAccent,
                child: Text('¿Ya tienes cuenta? Login.'),
                onPressed: () => Navigator.pushNamed(context, 'login'),
              ),
            ]),
      ),
    );
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
              gMensaje('Me llamo Glunote ¿Y tú?'),
              SizedBox(
                height: 21.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30.0)),
                    isDense: true,
                    hintText: 'Nombre',
                    labelText: 'Escribe tu nombre',
                  ),
                  onChanged: (valor) {
                    setState(() {
                      prefs.nombre = valor;
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
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30.0)),
                    isDense: true,
                    hintText: 'Apellido',
                    labelText: 'Escribe tu apellido',
                  ),
                  onChanged: (value) => {},
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              Row(
                children: <Widget>[
                  _prevButton(),
                  SizedBox(width: screenWidth(context) * 0.25),
                  _nextButton()
                ],
              ),
            ]),
      ),
    );
  }

  Widget _pagina3(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gMensaje('Ok ${prefs.nombre}.\n¿Cuál es tu sexo biológico?'),
              SizedBox(
                height: 21.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      controller.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: Text(
                      'Hombre',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      controller.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.fastOutSlowIn);
                    },
                    child: Text(
                      'Mujer',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  '¿Por qué preguntas esto?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[_prevButton()],
              )
            ]),
      ),
    );
  }

  Widget _pagina4(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gMensaje('¿Hace cuánto tiempo tienes Diabetes tipo I?'),
              SizedBox(
                height: 21.0,
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Menos de 6 meses',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Hace un año',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Entre 2 y 4 años',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Más de 5 años',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[_prevButton()],
              )
            ]),
      ),
    );
  }

  Widget _pagina5(context) {
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
                  'Bien!, tienes experiencia.\n¿En qué nivel de HbA1c estás?'),
              SizedBox(
                height: 36.0,
              ),
              Slider(
                activeColor: Colors.redAccent,
                value: _valorSlider,
                divisions: 100,
                label: "${_valorSlider.toStringAsFixed(1)}",
                min: 5.8,
                max: 15.0,
                onChanged: (valor) {
                  setState(() {
                    _valorSlider = valor;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('5.8'),
                  Text('15'),
                ],
              ),
              SizedBox(height: 12),
              Text('${_valorSlider.toStringAsFixed(1)}',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  '¿Por qué preguntas esto?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(height: 12),
              Row(
                children: <Widget>[
                  _prevButton(),
                  SizedBox(width: screenWidth(context) * 0.25),
                  _nextButton()
                ],
              ),
            ]),
      ),
    );
  }

  Widget _pagina6(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gMensaje('¿Cuál es tu glicemia objetivo?'),
              SizedBox(
                height: 36.0,
              ),
              Slider(
                activeColor: Colors.redAccent,
                value: _valorSlider2,
                divisions: 100,
                label: "${_valorSlider2.round()}",
                min: 90.0,
                max: 140.0,
                onChanged: (valor) {
                  setState(() {
                    _valorSlider2 = valor;
                    prefs.glicemiaObjetivo = valor;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('90'),
                  Text('140'),
                ],
              ),
              SizedBox(height: 12),
              Text('${_valorSlider2.round()}',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  '¿Qué Significa esto?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(height: 12),
              Row(
                children: <Widget>[
                  _prevButton(),
                  SizedBox(width: screenWidth(context) * 0.25),
                  _nextButton()
                ],
              ),
            ]),
      ),
    );
  }

  Widget _pagina7(context) {
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
                  'Ese objetivo de 100mg/dL podemos alcanzarlo!\n¿Qué esquema de insulina usas?'),
              SizedBox(
                height: 21.0,
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Esquema fijo',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Esquema basal-bolo',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Bomba de insulina',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(height: 12),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  '¿Qué Significa esto?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[_prevButton()],
              )
            ]),
      ),
    );
  }

  Widget _pagina8(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.099,
            vertical: screenHeight(context) * 0.052),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gMensaje('¿Qué insulina usas cada día?'),
              SizedBox(
                height: 21.0,
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Lenta y rápida',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);
                },
                child: Text(
                  'Ultralenta y ultrarrápida',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[_prevButton()],
              )
            ]),
      ),
    );
  }

  Widget _pagina9(context) {
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
                  'Cuando comes, ¿Cada cuántos carbohidratos usas 1 unidad de insulina?\nEsto es tu ratio.'),
              SizedBox(
                height: 21.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 81.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30.0)),
                    isDense: true,
                    labelText: 'Ratio',
                  ),
                  onChanged: (value) {
                    prefs.ratio = double.parse(value);
                  },
                ),
              ),
              SizedBox(height: 12),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  '¿Qué Significa esto?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(height: 12),
              Row(
                children: <Widget>[
                  _prevButton(),
                  SizedBox(width: screenWidth(context) * 0.25),
                  _nextButton()
                ],
              ),
            ]),
      ),
    );
  }

  Widget _pagina10(context) {
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
                  'Si tu glicemia está fuera del objetivo, ¿Cada cuantos mg/dL usas 1 unidad de insulina?\nEsto es sensibilidad.'),
              SizedBox(
                height: 21.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 81.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(30.0)),
                    isDense: true,
                    labelText: 'Sensibilidad',
                  ),
                  onChanged: (value) {
                    prefs.sensibilidad = double.parse(value);
                  },
                ),
              ),
              SizedBox(height: 12),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  '¿Qué Significa esto?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(height: 12),
              Row(
                children: <Widget>[
                  _prevButton(),
                  SizedBox(width: screenWidth(context) * 0.25),
                  _nextButton()
                ],
              ),
            ]),
      ),
    );
  }

  Widget _pagina11(context) {
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
                  'Genial! Lo estás haciendo bien!\nCon algunas respuestas más podré darte mejores consejos.'),
              SizedBox(
                height: 21.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    textColor: Colors.redAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, 'registrar');
                    },
                    child: Text(
                      'Prefiero después',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      // controller.nextPage(
                      //     duration: Duration(milliseconds: 200),
                      //     curve: Curves.fastOutSlowIn);
                      Navigator.pushNamed(context, 'registro');
                    },
                    child: Text(
                      'Vamos!',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
            ]),
      ),
    );
  }

  Widget _nextButton() {
    return FloatingActionButton(
      heroTag: 'next',
      mini: true,
      elevation: 0.0,
      onPressed: () {
        controller.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      },
      child: Icon(Icons.arrow_forward),
      backgroundColor: Color.fromRGBO(255, 23, 68, 1.0),
    );
  }

  Widget _prevButton() {
    return FloatingActionButton(
      heroTag: 'back',
      mini: true,
      elevation: 0.0,
      onPressed: () {
        controller.previousPage(
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      },
      child: Icon(Icons.arrow_back),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      foregroundColor: Color.fromRGBO(255, 23, 68, 1.0),
      shape:
          CircleBorder(side: BorderSide(color: Colors.redAccent, width: 2.0)),
    );
  }
}
