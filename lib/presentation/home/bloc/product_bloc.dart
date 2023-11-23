import 'package:baby_shop/data/datasources/product_remote_datasource.dart';
import 'package:baby_shop/data/models/responses/product_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(_Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await ProductRemoteDatasource().getAllProduct();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
