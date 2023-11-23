import 'package:baby_shop/data/datasources/auth_remote_datasource.dart';
import 'package:baby_shop/data/models/requests/login_request_model.dart';
import 'package:baby_shop/data/models/responses/auth_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_event.dart';
part 'signin_state.dart';
part 'signin_bloc.freezed.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().login(event.data!);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    }
    );
  }
}
