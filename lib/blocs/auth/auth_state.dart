part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class SuccessUserLoginState extends AuthState {
  final String uId;

  SuccessUserLoginState(this.uId);
}
class ErrorUserLoginState extends AuthState {}


class SuccessRegisterState extends AuthState {}
class ErrorRegisterState extends AuthState {}

class PickImageSuccessState extends AuthState {}
class PickImageErrorState extends AuthState {}


class SuccessCreateUserState extends AuthState {
  final String uId;

  SuccessCreateUserState(this.uId);
}
class ErrorCreateUserState extends AuthState {}