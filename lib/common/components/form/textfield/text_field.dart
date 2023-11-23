import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  const QTextField({
    Key? key,
    this.id,
    required this.label,
    this.value,
    this.hint,
    this.helper,
    required this.controller,
    this.validator,
    this.obscure = false,
    this.enabled = true,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    required this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
  }

  getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    return textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = "";
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        enabled: widget.enabled,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: Icon(
            widget.suffixIcon,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          helperText: widget.helper,
          hintText: widget.hint,
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
