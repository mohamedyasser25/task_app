part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class Loading extends ProductsState {}
class GetProductsState extends ProductsState {
 final ProductsResponse productsResponse;

  GetProductsState(this.productsResponse);
}