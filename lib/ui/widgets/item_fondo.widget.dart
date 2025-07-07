import 'package:flutter/material.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/fondo.model.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/currency_formatter.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/chart_widget.dart';

class ItemFondo extends StatelessWidget {
  final Fondo fondo;
  const ItemFondo({super.key, required this.fondo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'product_detail', arguments: fondo);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundCardBallance,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    fondo.nombre,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 20.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$ ${CurrencyFormatter.format(fondo.montoMinimo)}',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 14.0,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const LinechartWidget(),
          ],
        ),
      ),
    );
  }
}