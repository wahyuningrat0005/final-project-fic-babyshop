import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String? hint;
  final Function(String value) onChanged;
  const SearchField({
    Key? key,
    required this.onChanged,
    this.hint = "Search",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.green)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                ),
              ),
              onChanged: (value) => onChanged(value),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }
}
