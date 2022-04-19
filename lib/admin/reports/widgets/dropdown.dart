import 'package:flutter/material.dart';

import 'dropdown_select.dart';

class DropDownTile extends StatefulWidget {
  List<String> list;
  Function onchanged;
  String initial;
  String? message;
  DropDownTile({
    Key? key,
    this.message,
    required this.initial,
    required this.list,
    required this.onchanged,
  }) : super(key: key);

  @override
  _DropDownTileState createState() => _DropDownTileState();
}

class _DropDownTileState extends State<DropDownTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
              child: Container(
                width: 200,
                height: 75,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Material(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).colorScheme.onPrimary,
                        shadowColor: Colors.grey[100],
                        child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: DropDownSelect(
                                onChanged: widget.onchanged,
                                value: widget.initial,
                                heading: "Select Category",
                                items: widget.list)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
