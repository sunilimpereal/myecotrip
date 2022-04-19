import 'package:flutter/material.dart';

class IssTicDropDown extends StatefulWidget {
  double width;
  List<String> options;
  String hint;
  IssTicDropDown({
    Key? key,
    required this.width,
    required this.options,
    required this.hint,
  }) : super(key: key);

  @override
  State<IssTicDropDown> createState() => _IssTicDropDownState();
}

class _IssTicDropDownState extends State<IssTicDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widget.width,
        child: DropdownButton<String>(
          hint: Text(widget.hint),
          underline: Container(),
          items: widget.options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}
