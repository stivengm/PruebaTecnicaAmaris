import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/fondo.model.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/transaction.model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<AmountBallance>((event, emit) {
      emit(state.copyWith(amountBallance: event.amount));
    });

    on<SuscribirAFondo>((event, emit) {
      final updatedBallance = state.amountBallance - event.monto;

      final newTransaction = TransactionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        description: "Compra de ${event.fondo.nombre}",
        amount: event.monto,
        isAddBalance: false,
      );

      final fondoComprado = Fondo(
        nombre: event.fondo.nombre,
        montoMinimo: event.fondo.montoMinimo,
        valorActual: event.monto
      );

      final nuevosFondos = List<Fondo>.from(state.fondosSuscritos)
        ..add(fondoComprado);

      final nuevasTransacciones = List<TransactionModel>.from(state.transactionsList)
        ..add(newTransaction);

      emit(state.copyWith(
        amountBallance: updatedBallance,
        fondosSuscritos: nuevosFondos,
        transactionsList: nuevasTransacciones,
      ));
    });

    on<RemoveFondoSuscritoEvent>((event, emit) {
      final updatedFondos = List<Fondo>.from(state.fondosSuscritos)
        ..remove(event.fondo);

      final newTransaction = TransactionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        description: "Venta de ${event.fondo.nombre}",
        amount: event.fondo.valorActual!,
        isAddBalance: true,
      );

      final nuevasTransacciones = List<TransactionModel>.from(state.transactionsList)
        ..add(newTransaction);

      emit(state.copyWith(
        amountBallance: state.amountBallance + event.fondo.valorActual!,
        fondosSuscritos: updatedFondos,
        transactionsList: nuevasTransacciones,
      ));
    });
  }
}
