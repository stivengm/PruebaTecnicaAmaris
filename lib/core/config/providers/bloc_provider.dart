import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/home/home_bloc.dart';
import 'package:prueba_tecnica_amaris_flutter/core/blocs/login/login_bloc.dart';

final List<BlocProvider> blocProvider = [
  BlocProvider<LoginBloc>(create: ( _ ) => LoginBloc()),
  BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc())
];