// ignore_for_file: unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class ECTExtField extends StatefulWidget {
  Function onTap;
  FocusNode focusNode;
  Stream<Object> stream;
  Function(String) onChanged;
  String labelText;
  IconData icon;
  TextEditingController controller;

  /// text field
  /// errror from stream
  final String error;

  /// if has focus to highlight with border and elevation
  /// example :
  ///  onfocus: focusNode.hasfocus
  final bool onfocus;

  ///width of the text field
  final double width;

  ///heading on the textfield
  String heading;

  bool obscureText;
  TextInputType? keyboardType;

  ECTExtField(
      {Key? key,
      required this.controller,
      this.error = "",
      required this.focusNode,
      required this.heading,
      required this.icon,
      this.keyboardType,
      required this.labelText,
      required this.obscureText,
      required this.onChanged,
      required this.onTap,
      required this.onfocus,
      required this.stream,
      required this.width})
      : super(key: key);

  @override
  State<ECTExtField> createState() => _ECTExtFieldState();
}

class _ECTExtFieldState extends State<ECTExtField> {
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    final ShakingErrorController controller =
        ShakingErrorController(initialErrorText: "", hiddenInitially: true);
    return StreamBuilder<Object>(
        stream: widget.stream,
        builder: (context, snapshot) {
          log("snap received ${snapshot.data}");
          if (snapshot.hasError || widget.error.length > 1) {
            controller.changeErrorText(error: snapshot.error.toString());
             errorText = snapshot.error.toString();
            if (widget.error.length > 1) {
              controller.changeErrorText(error: widget.error);
              errorText = widget.error;
            }
           
            controller.mountError();
            controller.showError();
            controller.shakeErrorText();
          } else {
            errorText = "";
            controller.unMountError();
            controller.showError();
            controller.shakeErrorText();
          }
          return Container(
            width: widget.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  child: TextField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.w600,
                    ),
                    onTap: () {
                      widget.onTap();
                    },
                    obscureText: widget.obscureText,
                    onChanged: widget.onChanged,
                    keyboardType: widget.keyboardType,
                    decoration: InputDecoration(
                      // errorText: "${snapshot.error}",
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                      hintText: widget.labelText,
                      labelText: widget.labelText,
                      prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
                      isDense: false,
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.3) , fontSize: 14),
                      labelStyle: TextStyle(
                        height: 0.9,
                        fontSize: 14,
                        color: Theme.of(context).textTheme.headline1!.color!.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShakingErrorText(
                    controller: controller,
                    errorText: errorText,
                  ),
                )
              ],
            ),
          );
        });
  }
}

class ShakingErrorController extends ChangeNotifier {
  bool get isMounted => _isMounted;
  bool get isVisible => _isVisible;

  String get errorText => _errorText;

  final String _errorText;
  bool _isVisible = true;
  bool _isMounted = true;
  String initialErrorText;
  CustomAnimationControl _controlSignal = CustomAnimationControl.play;

  ShakingErrorController(
      {this.initialErrorText = 'Error',
      bool revealWithAnimation = true,
      bool hiddenInitially = true})
      : _errorText = initialErrorText,
        _isVisible = !hiddenInitially,
        _controlSignal =
            (revealWithAnimation) ? CustomAnimationControl.play : CustomAnimationControl.stop;
  set errorText(String errorText) {}

  void _onAnimationStarted() {
    _controlSignal = CustomAnimationControl.play;
  }

  void changeErrorText({required String error}) {
    initialErrorText = error;
  }

  void shakeErrorText() {
    _controlSignal = CustomAnimationControl.playFromStart;
    notifyListeners();
  }

  /// fully [unmount] and remove the error text
  void unMountError() {
    _isMounted = false;
    notifyListeners();
  }

  /// [remount] error text .  will not be effective if its already mounted
  void mountError() {
    _isMounted = true;
    notifyListeners();
  }

  // hide the error . but it will still be taking its space
  void hideError() {
    _isVisible = false;
    notifyListeners();
  }

  /// just shows error without any animation
  void showError() {
    _isVisible = true;
    notifyListeners();
  }

  //shows error without the reveal [animation]
  void revealError() {
    showError();
    shakeErrorText();
  }
}

enum ErrorAnimationProp { offset }

class ShakingErrorText extends StatelessWidget {
  final ShakingErrorController controller;
  final int timeToShake;
  final MultiTween<ErrorAnimationProp> _tween;
  final String errorText;
  // ignore: use_key_in_widget_constructors
  ShakingErrorText({Key? key, required this.controller, this.timeToShake = 1, required this.errorText})
      : _tween = MultiTween<ErrorAnimationProp>() {
    List.generate(
        timeToShake,
        (_) => _tween
          ..add(ErrorAnimationProp.offset, Tween<double>(begin: 0, end: 10),
              const Duration(milliseconds: 100))
          ..add(ErrorAnimationProp.offset, Tween<double>(begin: 0, end: 10),
              const Duration(milliseconds: 100))
          ..add(ErrorAnimationProp.offset, Tween<double>(begin: -10, end: 0),
              const Duration(milliseconds: 100)));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShakingErrorController>.value(
        value: controller,
        child: Consumer<ShakingErrorController>(builder: (context, errorController, child) {
          return CustomAnimation<MultiTweenValues<ErrorAnimationProp>>(
            control: errorController._controlSignal,
            curve: Curves.easeOut,
            duration: _tween.duration,
            tween: _tween,
            animationStatusListener: (status) {
              if (status == AnimationStatus.forward) {
                controller._onAnimationStarted();
              }
            },
            builder: (BuildContext context, Widget? child, tweenValues) {
              return Transform.translate(
                offset: Offset(tweenValues.get(ErrorAnimationProp.offset), 0),
                child: child,
              );
            },
            child: Visibility(
              visible: controller.isVisible && controller.isMounted,
              maintainSize: controller.isMounted,
              maintainAnimation: controller.isMounted,
              maintainState: controller.isMounted,
              child: Text(
                errorText,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }));
  }
}
