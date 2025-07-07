part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoaderLogin;
  final double amountBallance;
  final String userName;
  final String email;
  final DateTime date;
  final List<TransactionModel> transactionsList;
  final List<Fondo> fondosSuscritos;

  HomeState({
    this.isLoaderLogin = false,
    this.amountBallance = 0.0,
    this.userName = '',
    this.email = '',
    DateTime? date,
    this.transactionsList = const [],
    this.fondosSuscritos = const [],
  }) : date = date ?? DateTime.now();

  HomeState copyWith({
    bool? isLoaderLogin,
    double? amountBallance,
    String? userName,
    String? email,
    DateTime? date,
    List<TransactionModel>? transactionsList,
    List<Fondo>? fondosSuscritos,
  }) {
    return HomeState(
      isLoaderLogin: isLoaderLogin ?? this.isLoaderLogin,
      amountBallance: amountBallance ?? this.amountBallance,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      date: date ?? this.date,
      transactionsList: transactionsList ?? this.transactionsList,
      fondosSuscritos: fondosSuscritos ?? this.fondosSuscritos,
    );
  }
  
  @override
  List<Object?> get props => [
    isLoaderLogin,
    amountBallance,
    userName,
    email,
    date,
    transactionsList,
    fondosSuscritos
  ];
}

final class HomeInitial extends HomeState {
   HomeInitial()
    : super(
      amountBallance: 500000,
      userName: "Stiven Gómez",
      email: "stivenalexander7u7@gmail.com",
      transactionsList: [
        TransactionModel(
          id: "549842511610",
          description: "Recarga inicial",
          amount: 500000,
          isAddBalance: true,
        ),
      ],
    );
}
