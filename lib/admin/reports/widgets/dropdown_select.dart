import 'dart:developer';

import 'package:flutter/material.dart';

class DropDownSelect extends StatefulWidget {
  List<String> items;
  String heading;
  Function onChanged;
  String value;
  DropDownSelect({
    Key? key,
    required this.heading,
    required this.items,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelect> {
  List<Widget> list = [];
  int a = 0;
  @override
  void initState() {
    list = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //dropdown
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: DropdownButton<String>(
                    value: "Select category",
                    elevation: 16,
                    isDense: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 25,
                    ),
                    underline: Container(),
                    style: const TextStyle(color: Colors.deepPurple),
                    dropdownColor: Theme.of(context).colorScheme.onPrimary,
                    onChanged: (String? newValue) {},
                    selectedItemBuilder: (BuildContext context) {
                      return ["1"].map<Widget>((String item) {
                        return Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.value == ''
                                        ? "Select category"
                                        : widget.value,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              )),
                            ],
                          ),
                        );
                      }).toList();
                    },
                    items: ["Select category", "widget"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          enabled: false,
                          alignment: Alignment.centerLeft,
                          child: value == "Select category"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Select Colums",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                )
                              : DropDownSelector(
                                  value: widget.value,
                                  list: widget.items,
                                  onChnaged: (value) {
                                    setState(() {
                                      widget.value = value;
                                      widget.onChanged(value);
                                    });
                                  },
                                ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          //selected items
        ],
      ),
    );
  }
}

class DropDownSelector extends StatefulWidget {
  List<String> list;
  String value;
  Function onChnaged;
  DropDownSelector(
      {Key? key,
      required this.onChnaged,
      required this.value,
      required this.list})
      : super(key: key);

  @override
  _DropDownSelectorState createState() => _DropDownSelectorState();
}

class _DropDownSelectorState extends State<DropDownSelector> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    style: TextStyle(fontSize: 16),
                    cursorColor: Theme.of(context).textTheme.bodyText1!.color,
                    decoration: InputDecoration(
                      // errorText: "${snapshot.error}",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, right: 10, top: 5, bottom: 15),
                      hintText: "Search",
                      prefixIconConstraints:
                          BoxConstraints(minWidth: 23, maxHeight: 20),
                      isDense: false,
                      hintStyle: TextStyle(
                        height: 0.6,
                        fontSize: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.search,
                  size: 18,
                )
              ],
            ),
          ),
          Container(
            width: 200,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.list
                      .where((element) =>
                          element.toLowerCase().startsWith(query.toLowerCase()))
                      .toList()
                      .map((e) => Container(
                          width: 200,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  activeColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  checkColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  value: e == widget.value,
                                  onChanged: (value) {
                                    setState(() {
                                      value ?? false
                                          ? widget.value = e
                                          : widget.value = '';
                                      widget.onChnaged(e);
                                    });
                                  }),
                              Text(
                                e,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )))
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }
}
