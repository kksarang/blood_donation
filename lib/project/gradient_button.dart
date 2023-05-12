import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientButton extends StatelessWidget {
  GradientButton({
    Key? key,
    this.horizontalPadding,
    this.vertiaclPadding,
    this.borderRadius,
    this.width,
    this.height,
    this.splashColor,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    required this.isDisabled,
  }) : super(key: key);

  double? horizontalPadding;
  double? vertiaclPadding;
  double? borderRadius;
  double? width;
  double? height;
  Color? splashColor;
  Widget? child;
  Function()? onTap;
  Function()? onDoubleTap;
  Function()? onLongPress;
  bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 0,
        vertical: vertiaclPadding ?? 0,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: isDisabled ? null : splashColor ?? Colors.red,
          onTap: isDisabled ? () {} : onTap ?? () {},
          onDoubleTap: isDisabled ? () {} : onDoubleTap ?? () {},
          onLongPress: isDisabled ? () {} : onLongPress ?? () {},
          child: Container(
            width: width ?? size.width,
            height: height ?? size.height / 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              gradient: LinearGradient(
                colors: [
                  isDisabled ? Colors.white : Color.fromARGB(255, 25, 125, 224),
                  isDisabled ? Colors.white : Color.fromARGB(255, 4, 132, 171)
                ],
                // begin: Alignment.centerLeft,
                // end: Alignment.centerRight,
              ),
            ),
            child: child,
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
