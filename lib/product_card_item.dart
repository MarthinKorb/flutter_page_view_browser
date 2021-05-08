import 'package:flutter/material.dart';
import 'package:flutter_page_view_browser/product.dart';

class ProductCardItem extends StatefulWidget {
  final Product produto;

  const ProductCardItem({Key key, @required this.produto}) : super(key: key);

  @override
  _ProductCardItemState createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  int _quantity = 0;

  void _incrementQuantity() {
    if (_quantity <= 9) {
      setState(() {
        _quantity += 1;
      });
    }
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity >= 1) {
        _quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _buildProductImageContainer(widget.produto),
          _buildExpressoesContainer(widget.produto),
          _buildPriceContainer(widget.produto),
          _buildButtonsContainer(widget.produto),
        ],
      ),
    );
  }

  Container _buildProductImageContainer(Product produto) {
    return Container(
      child: Image.network(produto.imageUrl),
    );
  }

  Widget _buildExpressoesContainer(Product produto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            produto.description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(produto.cabedal),
          Text(produto.solado),
        ],
      ),
    );
  }

  Widget _buildPriceContainer(Product produto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'R\$${produto.price.toStringAsPrecision(2)}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsContainer(Product produto) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconButtonContainer(
              icon: Icon(Icons.remove), onPressed: () => _decrementQuantity()),
          Container(
            margin: EdgeInsets.all(12),
            child: Text(
              '$_quantity',
              style: TextStyle(fontSize: 16),
            ),
          ),
          _buildIconButtonContainer(
              icon: Icon(Icons.add), onPressed: () => _incrementQuantity()),
        ],
      ),
    );
  }

  Widget _buildIconButtonContainer(
      {@required Icon icon, @required Function onPressed}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black12,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
