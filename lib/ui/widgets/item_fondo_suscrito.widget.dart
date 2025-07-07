import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/home/home_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/fondo.model.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/currency_formatter.dart';

class ItemFondoSuscrito extends StatelessWidget {
  final Fondo fondo;

  const ItemFondoSuscrito({super.key, required this.fondo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10.0),
      height: 200.0,
      child: Stack(
        children: [
          Container(
            height: 200.0,
            
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColor.withValues(alpha: .2),
                  blurRadius: 5.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // color: AppColors.whiteColor,
            child: ListTile(
              title: Text(
                fondo.nombre,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 20.0,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "\$${CurrencyFormatter.format(fondo.valorActual!)}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(RemoveFondoSuscritoEvent(fondo: fondo));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Se ha vendido ${fondo.nombre} en \$ ${CurrencyFormatter.format(fondo.montoMinimo)}',
                    ),
                  ),
                );
              },
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
