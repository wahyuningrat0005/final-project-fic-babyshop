part of 'signin_bloc.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = _Loading;
  const factory SigninState.success(AuthResponseModel data) = _Success;
  const factory SigninState.error(String message) = _Error;
}
