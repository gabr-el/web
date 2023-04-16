import 'package:web/model/Produto.dart';
import 'package:web/page/ProdutoEditPage.dart';
import 'package:web/wsClient/ProdutoWSClient.dart';
import 'package:flutter/material.dart';

class ListaProdutoPage extends StatefulWidget {
  const ListaProdutoPage({Key? key}) : super(key: key);

  @override
  State<ListaProdutoPage> createState() => _ListaProdutoPage();
}

class _ListaProdutoPage extends State<ListaProdutoPage> {
  List<Produto> lsProduto = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => loadProdutos());
  }

  void loadProdutos() async {
    lsProduto = await ProdutoWSClient().getAll();
      setState(() {

      });
    // ProdutoWSClient().getAll().then((value) {
    //   print("Ponto2");
    //   lsProduto = value;
    //   setState(() {
    //
    //   });
    // });
    print("Ponto1 ${lsProduto.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Produtos")),
      body: Flex(
        direction: Axis.vertical,
        children: [
          ElevatedButton(onPressed: addProdutoAction,
              child: Icon(Icons.add)),
          Expanded(child: ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount: lsProduto.length,
              itemBuilder: (context, index) {
                return templateRowListView(index);
              }
          ))
        ],
      )
    );
  }

  Widget templateRowListView(int index) {
    Produto produto = lsProduto[index];
    return Card(
      elevation: 10,
        child: InkWell(
            onTap: () => editarProdutoAction(produto),
            child: templateCellListView(produto))
    );
  }


  Widget templateCellListView(Produto produto) {
    return Padding(padding: EdgeInsets.all(5.0),
        child:Row(
          children: [
           Text("${produto.id}"),
           SizedBox(width: 50,),
           Text(produto.nome!),
            Expanded(child: Text("")),
            ElevatedButton(onPressed: addProdutoAction,
                child: Icon(Icons.close, )),
            //Icon(Icons.navigate_next, color: Colors.orange,)
          ],
        )
    );
  }

  void addProdutoAction() {

  }
  void editarProdutoAction(Produto produto) {
    Navigator.push(context,
      MaterialPageRoute( builder: (context) => ProdutoEditPage(produto: produto,)),
    ).then((value) => {
      loadProdutos()
      //print("Produto Alterado ${value.nome!}")
    });
  }
}
