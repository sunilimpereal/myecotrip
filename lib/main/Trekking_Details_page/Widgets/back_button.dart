import 'package:flutter/material.dart';
import 'package:myecotrip/constants/config.dart';

class CustomBackButton extends StatefulWidget {
  final void Function()? onTap;

  CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  void initState() {
    if (widget.onTap == null) {
      Navigator.pop(context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          clipBehavior: Clip.hardEdge,
          color: Colors.green.withOpacity(0.2),
          child: Center(
            child: Ink(
              width: 32.0,
              height: 32.0,
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.green.shade800,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class CustomIconButton extends StatefulWidget {
  final  Function onTap;
  IconData iconData;

  CustomIconButton({Key? key, required this.onTap,required this.iconData}) : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  void initState() {
    if (widget.onTap == null) {
      Navigator.pop(context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          clipBehavior: Clip.hardEdge,
          color: Color(0xff24A645).withOpacity(0.07),
          child: Center(
            child: Ink(
              width: 32.0,
              height: 32.0,
              child: InkWell(
                splashColor: Color(0xff24A645).withOpacity(0.5),
                onTap: () {
                 widget.onTap();
                },
                child: Center(
                  child: Icon(
                    widget.iconData,
                    color:Color(0xff24A645),
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//             height: 32,
//             width: 32,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 color: Colors.white.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(10)),
//             alignment: Alignment.center,
//             child: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: Colors.black,
//             ),
//           ),
