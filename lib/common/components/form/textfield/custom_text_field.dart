import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(String value)? onChanged;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.helper,
    this.value,
    this.validator,
    this.maxLength,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        enabled: widget.enabled,
        controller: widget.controller,
        validator: widget.validator,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: Icon(widget.suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          helperText: widget.helper,
          hintText: widget.hint,
        ),
      ),
    );
  }
}
