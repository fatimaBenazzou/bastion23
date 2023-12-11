import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabSelect;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelect,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: widget.onTabSelect,
      items: [
        buildNavigationBarItem('home', 0),
        buildNavigationBarItem('Image', 1),
        buildNavigationBarItem('camera', 2),
        buildNavigationBarItem('Flame', 3),
        buildNavigationBarItem('profile', 4),
      ],
    );
  }

  BottomNavigationBarItem buildNavigationBarItem(String icon, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/$icon.svg'),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.currentIndex == index
                  ? ThemeConfig.lilas
                  : Colors.transparent,
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
