import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/modules/produto/ui/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => showMyDialog(context),
          ),
        ],
        title: Text('Produtos'),
      ),
      body: ProductPage(),
    );
  }
}

showMyDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Icon(Icons.info_outlined),
          SizedBox(width: 6),
          Text('Aviso'),
        ],
      ),
      content: Text('Deseja confirmar o pedido?'),
      actions: [
        ElevatedButton(
          child: Text('Não'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text('Sim'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
