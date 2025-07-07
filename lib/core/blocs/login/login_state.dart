part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  final bool isLoaderLogin;

  const LoginState({
    this.isLoaderLogin = false,
  });

  LoginState copyWith({
    bool? isLoaderLogin,
  });
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial({super.isLoaderLogin = false});

  @override
    LoginInitial copyWith({bool? isLoaderLogin}) {
      return LoginInitial(
        isLoaderLogin: isLoaderLogin ?? this.isLoaderLogin,
      );
    }
}
