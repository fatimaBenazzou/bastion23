import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 12,
        ),
        const Icon(Icons.arrow_forward_ios_rounded,
            color: ThemeConfig.secondaryColor),
        // Container(
        //   margin: const EdgeInsets.only(left: 130.0),
        //   child: Image.asset(
        //     'assets/icons/Progress_Bar.png',
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ],
    );
  }
}
