import 'dart:developer';

import 'package:flutter/material.dart';

class ECStreamButton extends StatefulWidget {
  Stream<List<String>> formValidationStream;
  Function submit;
  String text;
  String errorText;
  bool errorFlag;

  //width
  double? width;
  ECStreamButton({
    Key? key,
    required this.formValidationStream,
    required this.submit,
    required this.text,
    this.width,
    required this.errorText,
    required this.errorFlag,
  }) : super(key: key);

  @override
  State<ECStreamButton> createState() => _ECStreamButtonState();
}

class _ECStreamButtonState extends State<ECStreamButton> {
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          StreamBuilder<Object>(
              stream: widget.formValidationStream,
              builder: (context, snapshot) {
                log("snap ${snapshot.hasData.toString()}");
                return Column(
                  children: [
                    SizedBox(
                      width: widget.width,
                      child: SizedBox(
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.text,
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[700],

                              // onSurface: Theme.of(context).colorScheme.onPrimary,
                              onSurface: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(8.0),
                              ),
                              elevation: snapshot.hasError || !snapshot.hasData ? 0 : 5),
                          onPressed: snapshot.hasError || !snapshot.hasData
                              ? () {
                                  setState(() {
                                    error = 'Fill all Fields';
                                  });
                                }
                              : () {
                                  setState(() {
                                    error = '';
                                  });
                                  widget.submit();
                                },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    error != ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color: Theme.of(context).errorColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                error,
                                style: TextStyle(color: Theme.of(context).errorColor),
                              ),
                            ],
                          )
                        : Container(),
                    widget.errorFlag && error == ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color: Theme.of(context).errorColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.errorText,
                                style: TextStyle(color: Theme.of(context).errorColor),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                );
              })
        ],
      ),
    );
  }
}
