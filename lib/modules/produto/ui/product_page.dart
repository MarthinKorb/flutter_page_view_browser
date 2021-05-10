import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/modules/produto/infra/repositories/products_mock_repository.dart';

import 'package:flutter_page_view_browser/modules/produto/repositories/i_products_repository.dart';
import 'package:flutter_page_view_browser/modules/produto/ui/products_list_view.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ScrollController _scrollController;

  IProductsRepository productsRepository;

  _ProductPageState() {
    this.productsRepository = ProductsMockRepository();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.of(context).size.height;

    void _moveUp() {
      _scrollController.animateTo(_scrollController.offset - itemSize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    void _moveDown() {
      _scrollController.animateTo(_scrollController.offset + itemSize,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    return Column(
      children: [
        _buildOrderInfoContainer(),
        _buildSearchTextFieldContainer(),
        _buildProductsListViewContainer(),
        _buildActionsUpAndDownContainer(_moveUp, _moveDown),
      ],
    );
  }

  Widget _buildOrderInfoContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nenhum item selecionado',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Mecadorias: R\$0,00',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Expanded _buildProductsListViewContainer() {
    return Expanded(
      child: ProductsListView(
        items: productsRepository.find(),
        scrollController: _scrollController,
      ),
    );
  }

  Container _buildSearchTextFieldContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'Pesquisar',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Container _buildActionsUpAndDownContainer(_moveUp(), _moveDown()) {
    return Container(
      padding: EdgeInsets.only(left: 12, bottom: 4, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              child: Icon(
                Icons.keyboard_arrow_up_outlined,
                color: Colors.white,
              ),
              onTap: () => _moveUp(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
              ),
              onTap: () => _moveDown(),
            ),
          ),
        ],
      ),
    );
  }
}
