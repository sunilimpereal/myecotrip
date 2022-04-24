import 'package:flutter/material.dart';

class AdButton extends StatelessWidget {
  Function onPressed;
  IconData icon;
  String text;
  bool outlined;
  Color color;
  double? width;
  Color borderColor;
  Color textColor;
  Color circleColor;
  AdButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.outlined = false,
      required this.text,
      this.color = Colors.green,
      this.borderColor = Colors.green,
      this.textColor = Colors.white,
      this.circleColor=Colors.white,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                    side: BorderSide(color: borderColor)),
                elevation: 4,
                primary: color),
            onPressed: () {
              onPressed();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Material(
                    color: circleColor,
                      elevation: 2,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          icon,
                          color: borderColor,
                        ),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
