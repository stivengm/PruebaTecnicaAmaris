import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/login/login_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/models/login_user.model.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/widgets/primary_button.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {

  bool _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (email) => email != null && !EmailValidator.validate(email) ? 'Ingrese un email válido' : null,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(
                color: AppColors.primaryColor
              ),
              filled: true,
              fillColor: AppColors.whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            obscureText: _passwordVisible,
            controller: passwordController,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (pass) => pass != null && pass.length < 6 ? 'Ingrese mínimo 6 caracteres' : null,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: AppColors.primaryColor
              ),
              filled: true,
              fillColor: AppColors.whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            ),
          ),
          const SizedBox(height: 10.0),
          const Text("Ha olvidado la contraseña?"),
          const SizedBox(height: 20.0),
          PrimaryButton(
            text: 'Siguiente',
            onPressed: login
          ),
          const SizedBox( height: 30.0),
          RichText(
            text: TextSpan(
              text: 'No tienes cuenta?',
              style: const TextStyle(
                color: AppColors.blackColor
              ),
              children: [
                TextSpan(
                  text: ' Regístrate',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  recognizer: _registro()
                )
              ]
            )
          ),
          const SizedBox(height: 20.0),
        ],
      )
    );
  }

  login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValidForm = formKey.currentState!.validate();
    if (!isValidForm) return;

    final loginBloc = BlocProvider.of<LoginBloc>(context);

    loginBloc.add(const IsLoader(true));

    LoginUserModel user = LoginUserModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );

    final resp = await loginBloc.login(user);

    if (resp.code == "TRX001") {
      loginBloc.add(const IsLoader(false));
      // Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    } else {
      // ScaffoldMessenger.of(context).clearSnackBars();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(resp.message))
      // );
    }
  }

  TapGestureRecognizer _registro() {
    return TapGestureRecognizer()..onTap = () {
      Navigator.pushNamed(context, 'register');
    };
  }
}