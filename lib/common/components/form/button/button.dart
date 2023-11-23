import 'package:flutter/material.dart';

import '../../../theme/theme_size.dart';

class QButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? color;
  final bool spaceBetween;
  final ThemeSize size;
  const QButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.spaceBetween = false,
    this.size = ThemeSize.md,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? MediaQuery.of(context).size.width;
    double widgetHeight = 52.0;
    double widgetFontSize = 16.0;
    double widgetIconSize = 24.0;
    return Container(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color.fromARGB(255, 52, 203, 10),
          ),
          onPressed: () => onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                Icon(
                  prefixIcon!,
                  size: widgetIconSize,
                ),
                const SizedBox(
                  width: 6.0,
                ),
              ],
              if (spaceBetween && prefixIcon != null) Spacer(),
              Text(
                label,
                style: TextStyle(
                  fontSize: widgetFontSize,
                ),
              ),
              if (suffixIcon != null) ...[
                Icon(
                  suffixIcon!,
                  size: widgetIconSize,
                ),
                const SizedBox(
                  width: 6.0,
                )
              ]
            ],
          )),
    );
  }
}
