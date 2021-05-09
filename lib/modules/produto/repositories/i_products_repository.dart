import 'package:flutter_page_view_browser/modules/produto/infra/models/product.dart';

abstract class IProductsRepository {
  List<Product> find();
}
