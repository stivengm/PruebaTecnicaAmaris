import 'package:flutter/material.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';

class CardItemWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expirationDate;
  final String cardType;
  const CardItemWidget({super.key, required this.cardNumber, required this.cardHolder, required this.expirationDate, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardNumber, style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 42.0)),
          Text(cardHolder, style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: AppColors.whiteColor, fontWeight: FontWeight.w400, fontSize: 20.0)),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Válida hasta", style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: AppColors.whiteColor, fontWeight: FontWeight.w400, fontSize: 15.0)),
                  const SizedBox(height: 8.0),
                  Text(expirationDate, style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: AppColors.whiteColor, fontWeight: FontWeight.w400, fontSize: 20.0)),
                ],
              ),
              const Spacer(),
              Text(cardType, style: Theme.of(context).textTheme.headlineLarge!.copyWith( color: AppColors.whiteColor, fontWeight: FontWeight.w400, fontSize: 20.0)),
            ],
          )
        ],
      ),
    );
  }
}