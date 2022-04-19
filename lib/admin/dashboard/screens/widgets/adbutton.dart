import 'package:flutter/material.dart';

class AdButton extends StatelessWidget {
  Function onPressed;
  IconData icon;
  String text;
  bool outlined;
  Color color;
  AdButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.outlined = false,
    required this.text,
    this.color = Colors.green
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
              elevation: 4,
              primary: color),
          onPressed: () {
            onPressed();
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  width: 8,
                ),
                Material(
                    elevation: 2,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        icon,
                        color: color,
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
