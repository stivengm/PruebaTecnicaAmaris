import 'package:flutter/material.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';

class LoaderApp extends StatelessWidget {
  const LoaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackColor.withValues(alpha: .8)
      ),
      width: double.infinity,
      height: media.height * 1,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}