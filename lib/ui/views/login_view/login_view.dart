import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/login/login_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/views/login_view/form_login.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/curved_widget.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/loader_app.widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    CurvedWidget(
                      curvedDistance: 80.0,
                      curvedHeight: 80.0,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 100.0, left: 50.0),
                        height: 300.0,
                        color: AppColors.primaryColor,
                        child: Text(
                          "Iniciar sesión",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 30.0, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 300.0,
                        right: 28.0,
                        left: 28.0,
                      ),
                      child: const FormLogin(),
                    ),
                    state.isLoaderLogin ? const LoaderApp() : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}