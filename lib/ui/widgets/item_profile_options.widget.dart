import 'package:flutter/material.dart';
import 'package:prueba_tecnica_amaris_flutter/ui/utils/app_colors.dart';

class ItemProfileOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ItemProfileOptions({super.key, required this.icon, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundCardBallance,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: const Icon(Icons.person, size: 40.0),
        onTap: onTap,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 24.0,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}