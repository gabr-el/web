import 'package:web/model/Produto.dart';
import 'package:web/wsClient/ProdutoWSClient.dart';
import 'package:flutter/material.dart';

class ProdutoEditPage extends StatefulWidget {
  ProdutoEditPage({required this.produto});
  Produto produto;
  @override
  State<ProdutoEditPage> createState() => _ProdutoEditPageState();
}

class _ProdutoEditPageState extends State<ProdutoEditPage> {
  TextEditingController tecNome = TextEditingController();
  TextEditingController tecDescricao = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tecNome.text = widget.produto.nome!;
    tecDescricao.text = widget.produto.descricao!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Produto")),
      body: Column(
        children: [
          TextField(controller: tecNome,),
          TextField(controller: tecDescricao,),
          ElevatedButton(onPressed: salvarAtion, child: Text("Salvar"))
        ],
      ) ,
    );
  }

  void salvarAtion() async{
    widget.produto.nome = tecNome.text;
    widget.produto.descricao = tecDescricao.text;
    bool result = await ProdutoWSClient().alterar(widget.produto);
    if (result) {
      Navigator.of(context).pop(widget.produto);
    }
    print("Falha ao Alterar Produto");
  }
}
