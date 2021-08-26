part of 'menu_cubit.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class LogoutSuccessState extends MenuState {}
class LogoutErrorState extends MenuState {}
