part of 'signin_bloc.dart';

@freezed
class SigninEvent with _$SigninEvent {
  const factory SigninEvent.started() = _Started;
  const factory SigninEvent.login(LoginRequestModel? data) = _Login;
}
