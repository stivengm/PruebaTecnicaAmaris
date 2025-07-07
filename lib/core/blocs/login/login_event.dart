part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IsLoader extends LoginEvent {
  final bool isLoading;

  const IsLoader(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}