import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_task/data/models/productsResponse.dart';
import 'package:magdsoft_task/data/repository/productsRepository.dart';

import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc(this.productsRepository) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProducts) {
        await getProducts(emit);
      }
    });
  }

  getProducts(Emitter<ProductsState> emit) async {
    print('hhhh');
    emit(Loading());
    await productsRepository
        .getProducts()
        .then((value) => emit(GetProductsState(value)));
  }
}
