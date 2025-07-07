import 'package:flutter/material.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/views/add_ballance_view/add_ballance_view.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/views/home_view/home_view.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/views/product_detail_view/product_detail_view.dart';

Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder> {
  'home': ( _ ) => const HomeView(),
  'add_ballance': ( _ ) => const AddBallanceView(),
  'product_detail': ( _ ) => const ProductDetailView(),
};