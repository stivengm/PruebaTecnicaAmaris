import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/home/home_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_images.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/item_profile_options.widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              ClipOval(
                child: Image.asset(
                  AppImages.imageProfile,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 5.0),
              Text(state.userName,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 24.0,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(state.email,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 15.0,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30.0),

              ItemProfileOptions(
                icon: Icons.person,
                title: "Perfil",
                subtitle: "Ver y editar tu perfil",
                onTap: () {},
              ),
              const SizedBox(height: 10.0),
              ItemProfileOptions(
                icon: Icons.person,
                title: "Configuración",
                subtitle: "Edita tu configuración",
                onTap: () {},
              ),
              const SizedBox(height: 10.0),
              ItemProfileOptions(
                icon: Icons.person,
                title: "Tarjetas",
                subtitle: "Añade o edita tus tarjetas",
                onTap: () {},
              ),
              const SizedBox(height: 10.0),
              ItemProfileOptions(
                icon: Icons.person,
                title: "Cerrar sesión",
                subtitle: "Cerrar sesión de tu cuenta",
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
