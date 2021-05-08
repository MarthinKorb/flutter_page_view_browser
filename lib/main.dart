import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/product.dart';
import 'package:flutter_page_view_browser/products_list_view.dart';

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
  List<Product> _items = List.generate(
    10,
    (index) => Product(
      id: index,
      imageUrl:
          'https://lojazeusdobrasil.com.br/arquivos/produtos/imagens_adicionais/botina-bota-de-seguranca-p-trabalho-bidensidade-marluvas-vulcaflex-10vb48_3183.jpeg',
      description: 'Bota de segurança confeccionada em couro',
      cabedal: 'Couro',
      solado: 'PU/PU Bidensidade',
      price: Random().nextDouble(),
    ),
  );

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.of(context).size.height;

    _moveUp() {
      _scrollController.animateTo(_scrollController.offset - itemSize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    _moveDown() {
      _scrollController.animateTo(_scrollController.offset + itemSize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Icon(Icons.arrow_back_outlined),
        title: Text('Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ProductsListView(
                items: _items,
                scrollController: _scrollController,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_upward_outlined,
                        color: Colors.black54,
                      ),
                      onTap: () => _moveUp(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.black54,
                      ),
                      onTap: () => _moveDown(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
