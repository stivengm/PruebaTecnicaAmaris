import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/home/home_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/fondo.model.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/currency_formatter.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/app_bar_widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/chart_widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/primary_button.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final fondo = ModalRoute.of(context)?.settings.arguments as Fondo;

    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget(
        title: fondo.nombre,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 0),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LinechartWidget(),
                  const SizedBox(height: 16.0),
                  Text(
                    'Monto Mínimo: \$ ${CurrencyFormatter.format(fondo.montoMinimo)}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Monto a comprar',
                      labelStyle: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.whiteColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  PrimaryButton(
                    text: 'Comprar',
                    onPressed: () {
                      final HomeBloc homeBloc = context.read<HomeBloc>();

                      if (double.tryParse(amountController.text.trim()) == null || amountController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, ingresa un monto válido'),
                          ),
                        );
                        return;
                      }

                      if (double.parse(amountController.text.trim()) < fondo.montoMinimo) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El monto mínimo para comprar ${fondo.nombre} es \$ ${CurrencyFormatter.format(fondo.montoMinimo)}',
                            ),
                          ),
                        );
                        return;
                      }

                      if (double.parse(amountController.text.trim()) > homeBloc.state.amountBallance) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'No tienes suficiente saldo para comprar ${fondo.nombre}',
                            ),
                          ),
                        );
                        return;
                      }

                      context.read<HomeBloc>().add(
                        SuscribirAFondo(
                          fondo: fondo,
                          monto: double.parse(amountController.text.trim()),
                        ),
                      );

                      amountController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Compra realizada para ${fondo.nombre}'),
                        ),
                      );

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}