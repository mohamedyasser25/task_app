import 'package:magdsoft_task/data/data_providers/remote/productsService.dart';
import 'package:magdsoft_task/data/models/productsResponse.dart';


class ProductsRepository{
  ProductsService productsService;
  ProductsRepository(this.productsService);
  Future<ProductsResponse> getProducts()async{
    print('bbb');
    var response = await productsService.getProducts();
    return ProductsResponse.fromJson(response);

  }
}