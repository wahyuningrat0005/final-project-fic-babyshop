import 'package:flutter/material.dart';

class MoreText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  const MoreText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  State<MoreText> createState() => _MoreTextState();
}

class _MoreTextState extends State<MoreText> {
  bool visible = false;

  updateVisibility() {
    visible = !visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          maxLines: visible == false ? 3 : null,
          overflow: visible == false ? TextOverflow.ellipsis : null,
          style: widget.style ??
              TextStyle(
                fontSize: 14.0,
              ),
        ),
        if (visible == false)
          InkWell(
            onTap: () => updateVisibility(),
            child: Text(
              "Read More",
              style: widget.style?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
      ],
    );
  }
}
