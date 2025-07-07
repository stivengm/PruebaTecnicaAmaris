import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/home/home_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/app_bar_widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/card_item_widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/item_transaction_widget.dart';

class AddBallanceView extends StatelessWidget {
  const AddBallanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondaryColor,
      appBar: const AppBarWidget(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tus tarjetas",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          "Tienes 1 tarjeta registrada",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.greyColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                CardItemWidget(
                  cardHolder: "Stiven Gómez",
                  cardNumber: "**** **** **** 1234",
                  expirationDate: "12/25",
                  cardType: "Visa",
                ),

                const SizedBox(height: 16.0),

                Text(
                  "Transacciones recientes",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),

                ...state.transactionsList.reversed.map((tx) => ItemTransactionWidget(
                  amount: tx.amount,
                  isAddBallance: tx.isAddBalance,
                  transactionDetails: tx.description,
                  transactionId: tx.id,
                )),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
