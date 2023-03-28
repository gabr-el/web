
import 'package:web/components/ElevatedButtonCustom.dart';
import 'package:web/components/TextFormFieldCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController tecNome = TextEditingController();
  TextEditingController tecFone = TextEditingController();
  TextEditingController tecSenha = TextEditingController();

  void _incrementCounter() {
    widget.title = "Meu App ${_counter}";
    tecFone.text =  tecNome.text;
    tecNome.text = "${_counter}";

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextFormFieldCustom.create(hint: "Nome", label: "Nome do Atleta", corTexto: Colors.deepOrange, tec: tecNome),
            TextFormFieldCustom.create(tec: tecFone, label: "Fone" ),
            TextFormFieldCustom.create(tec: tecSenha, label: "Senha", obscureText: true ),
            ElevatedButtonCustom.create(texto: "Ok", onPressed: onPressedOk,),
            ElevatedButtonCustom.createGenerico(onPressed: onPressedGenerico , child: TextFormFieldCustom.create(tec: tecFone, label: "Fone" ),)
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onPressedOk() {
    print("Create do MyHomePage");
  }

  void onPressedGenerico() {
    print("CreateGeneric do MyHomePage");
  }

}

extension TextFormFieldX on TextFormField {
  TextStyle? defStyle() {
    return null;
  }
}