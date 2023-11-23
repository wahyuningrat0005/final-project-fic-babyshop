import 'package:flutter/material.dart';

class QcategoryPicker extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final String? label;
  final dynamic value;
  final String? Function(int? value)? validator;
  final String? hint;
  final String? helper;
  final TextStyle? titleStyle;
  final Function(
    Map<String, dynamic> item,
    bool selected,
    Function action,
  )? itemBuilder;

  final Function(
    int index,
    String label,
    dynamic value,
    Map<String, dynamic> item,
  ) onChanged;

  const QcategoryPicker(
      {Key? key,
      required this.items,
      required this.onChanged,
      this.itemBuilder,
      this.value,
      this.validator,
      this.label,
      this.hint,
      this.helper,
      this.titleStyle})
      : super(key: key);

  @override
  State<QcategoryPicker> createState() => _QcategoryPickerState();
}

class _QcategoryPickerState extends State<QcategoryPicker> {
  List<Map<String, dynamic>> items = [];
  int selectedIndex = -1;

  updateIndex(newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    var item = items[selectedIndex];
    var index = selectedIndex;
    var label = item["label"];
    var value = item["value"];

    widget.onChanged(index, label, value, item);
  }

  getLabel() {
    if (widget.label == null) return Container();
    return Column(
      children: [
        Text(
          "${widget.label}",
          style: widget.titleStyle ??
              TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
        ),
        const SizedBox(
          height: 6.0,
        )
      ],
    );
  }

  @override
  void initState() {
    items = widget.items;
    if (widget.value != null) {
      selectedIndex = items.indexWhere((i) => i["value"] == widget.value);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField(
          initialValue: false,
          validator: (value) =>
              widget.validator!(selectedIndex == -1 ? null : selectedIndex),
          enabled: true,
          builder: (FormFieldState<bool> field) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: widget.label,
                errorText: field.errorText,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
                fillColor: Colors.transparent,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                helperText: widget.helper,
                hintText: widget.hint,
                labelStyle: widget.titleStyle,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    SingleChildScrollView(
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(items.length, (index) {
                            bool selected = selectedIndex == index;
                            var item = items[index];

                            if (widget.itemBuilder != null) {
                              return widget.itemBuilder!(item, selected, () {
                                updateIndex(index);
                              });
                            }

                            return Container(
                              height: 36,
                              margin: const EdgeInsets.only(
                                right: 12.0,
                              ),
                              child: ElevatedButton(
                                style: selected
                                    ? null
                                    : ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        elevation: 0.0,
                                      ),
                                onPressed: () => updateIndex(index),
                                child: Text(item["label"]),
                              ),
                            );
                          })),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
