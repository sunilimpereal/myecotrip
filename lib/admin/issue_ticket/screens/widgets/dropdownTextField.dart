import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

class DropdownTextField extends StatefulWidget {
  List<String> options;
  Function(String) onSelected;
  String labelText;
  TextEditingController controller;
  double? width;
  bool searchable;
  DropdownTextField(
      {required this.options,
      required this.onSelected,
      required this.labelText,
      required this.controller,
      this.width,
      this.searchable = true});
  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  getHeight() {
    if (widget.options.length < 4) {
      return Config().deviceHeight(context) * 0.08 * widget.options.length;
    } else {
      Config().deviceHeight(context) * 0.3;
    }
  }

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        if (widget.searchable) {
          _overlayEntry.markNeedsBuild();
        } else {}
      });
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    var size = renderBox!.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    height: getHeight(),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: widget.options
                          .where((element) =>
                              element.startsWith(widget.searchable ? widget.controller.text : ""))
                          .map((e) {
                        return ListTile(
                          title: Text(
                            e,
                            style: TextStyle(fontSize: 16),
                          ),
                          onTap: () {
                            widget.onSelected(e);
                            setState(() {
                              _focusNode.unfocus();
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Container(
        width: widget.width,
        child: Material(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8.0),
          child: TextFormField(
            focusNode: this._focusNode,
            controller: widget.controller,
            readOnly: !widget.searchable,
            style: TextStyle(
              fontSize: 14,
              fontFamily: Nunito,
              color: Theme.of(context).textTheme.headline1!.color,
              fontWeight: FontWeight.w700,
            ),
            decoration:
                InputDecoration(labelText: widget.labelText == "" ? null : widget.labelText),
          ),
        ),
      ),
    );
  }
}
