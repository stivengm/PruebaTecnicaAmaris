import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/home/home_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/fondo.model.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_images.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/currency_formatter.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/views/profile_view/profile_view.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/app_bar_widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/item_fondo.widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/item_fondo_suscrito.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Fondo> fondos = [
    Fondo(nombre: "FPV_BTG_PACTUAL_RECAUDADORA", montoMinimo: 75000),
    Fondo(nombre: "FPV_BTG_PACTUAL_ECOPETROL", montoMinimo: 125000),
    Fondo(nombre: "DEUDAPRIVADA", montoMinimo: 50000),
    Fondo(nombre: "FDO-ACCIONES", montoMinimo: 250000),
    Fondo(nombre: "FPV_BTG_PACTUAL_DINAMICA", montoMinimo: 100000),
  ];

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  List<Widget> get _screens => [
    RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hola, ',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w300,
                          ),
                      children: [
                        TextSpan(
                          text: state.userName,
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 25.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundCardBallance,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Saldo disponible",
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    fontSize: 20.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              "Julio 8, 2025",
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    fontSize: 14.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          "\$${CurrencyFormatter.format(state.amountBallance)}",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                fontSize: 30.0,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  state.fondosSuscritos.isNotEmpty
                    ? Text(
                        "Fondos suscritos",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 20.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const SizedBox.shrink(),

                  state.fondosSuscritos.isNotEmpty
                    ? const SizedBox(height: 10.0)
                    : const SizedBox.shrink(),

                  state.fondosSuscritos.isNotEmpty
                    ? SizedBox(
                        height: 150.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.fondosSuscritos.length,
                          itemBuilder: (context, index) {
                            final fondo = state.fondosSuscritos[index];
                            return ItemFondoSuscrito(fondo: fondo);
                          },
                        ),
                    )
                    : const SizedBox.shrink(),

                  state.fondosSuscritos.isNotEmpty
                    ? const SizedBox(height: 10.0)
                    : const SizedBox.shrink(),

                  Text(
                    "Fondos disponibles",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 20.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  ...fondos.map((fondo) => ItemFondo(fondo: fondo)),
                ],
              ),
            );
          },
        ),
      ),
    ),

    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Buscar fondo',
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
            ...fondos.map((fondo) => ItemFondo(fondo: fondo)),
          ],
        ),
      ),
    ),

    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const AppBarWidget(),
      body: IndexedStack(index: _currentIndex, children: _screens),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add_ballance');
              },
              shape: const CircleBorder(),
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.add, color: AppColors.whiteColor),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 0
                  ? AppImages.iconHomeSelected
                  : AppImages.iconHome,
              width: 24,
              height: 24,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 1
                  ? AppImages.iconSearchSelected
                  : AppImages.iconSearch,
              width: 24,
              height: 24,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 2
                  ? AppImages.iconUserSelected
                  : AppImages.iconUser,
              width: 24,
              height: 24,
            ),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
