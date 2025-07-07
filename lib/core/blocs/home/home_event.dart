part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AmountBallance extends HomeEvent {
  final double amount;

  const AmountBallance(this.amount);

  @override
  List<Object> get props => [ amount ];
}

class SuscribirAFondo extends HomeEvent {
  final Fondo fondo;
  final double monto;

  const SuscribirAFondo({required this.fondo, required this.monto});

  @override
  List<Object> get props => [ fondo, monto ];
}
class RemoveFondoSuscritoEvent extends HomeEvent {
  final Fondo fondo;

  const RemoveFondoSuscritoEvent({required this.fondo});

  @override
  List<Object> get props => [ fondo ];
}