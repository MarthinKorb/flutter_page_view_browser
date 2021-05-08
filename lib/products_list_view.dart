import 'package:flutter/material.dart';

import 'package:flutter_page_view_browser/product.dart';
import 'package:flutter_page_view_browser/product_card_item.dart';

class ProductsListView extends StatefulWidget {
  final List<Product> items;

  ProductsListView({@required this.items});

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  _moveUp() {
    _scrollController.animateTo(_scrollController.offset - widget.items.length,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    _scrollController.animateTo(_scrollController.offset + widget.items.length,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.items.length,
        controller: _scrollController,
        itemBuilder: (context, index) =>
            ProductCardItem(produto: widget.items[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward_rounded),
        mini: true,
        onPressed: () {
          _scrollController.animateTo(_scrollController.offset + itemSize,
              curve: Curves.linear, duration: Duration(milliseconds: 500));
        },
      ),
    );
  }
}
