part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class SuccessUserLoginState extends AuthState {}
class ErrorUserLoginState extends AuthState {}


class SuccessRegisterState extends AuthState {}
class ErrorRegisterState extends AuthState {}

class PickImageSuccessState extends AuthState {}
class PickImageErrorState extends AuthState {}


