import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';

class ItemTransactionWidget extends StatelessWidget {
  final String transactionId;
  final String transactionDetails;
  final double amount;
  final bool isAddBallance;

  const ItemTransactionWidget({
    super.key,
    required this.transactionId,
    required this.transactionDetails,
    required this.amount,
    required this.isAddBallance,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: 'es_CO',
      symbol: '',
      decimalDigits: 0,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet, color: AppColors.blackColor),
        title: Text(transactionId, style: TextStyle(color: AppColors.blackColor)),
        subtitle: Text(transactionDetails, style: TextStyle(color: AppColors.greyColor)),
        trailing: Text(
          '\$ ${formatter.format(amount)}',
          style: TextStyle(
            color: isAddBallance ? AppColors.greenColor : AppColors.redColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
