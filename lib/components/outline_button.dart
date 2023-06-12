import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class AppOutlineButton extends StatefulWidget {
  /// The button's height. Use [ElevarmButtonHeights] whenever possible.
  final double height;

  final Color borderColor;

  final Color backgroundColor;

  /// The button's child builder.
  final Widget Function(BuildContext context, bool isFocused, bool isHovered)
      builder;

  /// Callback when button is pressed. Set this value to null to disable the button.
  final VoidCallback? onPressed;

  /// The button's contet padding.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether to style the button as destructive/dangerous.
  final bool isDestructive;

  const AppOutlineButton({
    super.key,
    this.height = ElevarmButtonHeights.md,
    required this.builder,
    required this.onPressed,
    this.contentPadding,
    this.isDestructive = false, required this.borderColor, required this.backgroundColor,
  });

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();

  /// Creates [ElevarmOutlineButton] with only text as content.
  factory AppOutlineButton.text({
    Key? key,
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    required Color borderColor,
    required Color backgroundColor,
    Color textColor = Colors.white,
    bool isDestructive = false,
  }) {
    return AppOutlineButton(
      key: key,
      height: height,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      isDestructive: isDestructive,
      builder: (_, __, ___) {
        return Text(
          text,
          textAlign: TextAlign.center,
          style: ElevarmFontFamilies.inter(
            color: textColor,
            fontSize: ElevarmButtonTextFontSize.fromButtonHeights(height),
            fontWeight: ElevarmFontWeights.semibold,
          ),
        );
      },
    );
  }
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    late Color borderColor;
    late Color shadowColor;
    late Color primaryColor;
    late Color hoverColor;
    late Color focusColor;
    if (!widget.isDestructive) {
      borderColor = widget.borderColor;
      shadowColor = const Color(0xFFF2F4F7);
      primaryColor = widget.backgroundColor;
      hoverColor = ElevarmColors.neutral100;
      focusColor = ElevarmColors.white;
    } else {
      borderColor = ElevarmColors.white;
      shadowColor = const Color(0xFFFEE4E2);
      primaryColor = ElevarmColors.white;
      hoverColor = ElevarmColors.danger100;
      focusColor = ElevarmColors.white;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.sm,
        ),
        border: Border.all(color: borderColor),
        boxShadow: !_isFocused
            ? ElevarmBoxShadow.xs
            : [
                const BoxShadow(
                  color: Color.fromRGBO(16, 24, 40, 0.05),
                  offset: Offset(1.0, 0.0),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 4.0,
                ),
              ],
      ),
      child: Material(
        color: primaryColor,
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.sm,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            ElevarmBorderRadius.sm,
          ),
          onFocusChange: (value) {
            setState(() {
              _isFocused = value;
            });
          },
          hoverColor: hoverColor,
          focusColor: focusColor,
          onHover: (value) {
            setState(() {
              _isHovered = value;
            });
          },
          onTap: widget.onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ElevarmBorderRadius.sm,
              ),
            ),
            child: Padding(
              padding: widget.contentPadding ??
                  ElevarmButtonPadding.fromButtonHeights(widget.height),
              child: widget.builder(context, _isFocused, _isHovered),
            ),
          ),
        ),
      ),
    );
  }
}
