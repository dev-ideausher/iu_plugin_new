import 'package:flutter/material.dart';

import '../services/colors.dart';
import '../services/responsive_size.dart';
import '../services/text_style_util.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool isloading;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? trailing;
  final LinearGradient? linearGradient;
  final Color? color;
  final double? borderRadius;

  const CustomButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.isloading = false,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
  })  : outline = false,
        super(key: key);

  const CustomButton.outline({
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
  })  : disabled = false,
        isloading = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 48.kh,
            alignment: Alignment.center,
            decoration: !outline
                ? BoxDecoration(
                    // color: !disabled ? color ?? ColorUtil.kcPrimaryColor : color ?? ColorUtil.kcMediumGreyColor,
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
                    gradient: linearGradient ??
                        LinearGradient(
                            begin: Alignment(0, 0),
                            end: Alignment(0, 0),
                            colors: [
                              !disabled
                                  ? color ?? ColorUtil(context).kPrimaryColor
                                  : color ??
                                      ColorUtil(context).kPrimaryGreyColor,
                              !disabled
                                  ? color ?? ColorUtil(context).kPrimaryColor
                                  : color ??
                                      ColorUtil(context).kPrimaryGreyColor,
                            ]),
                  )
                : BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
                    border: Border.all(
                      color: color ?? ColorUtil(context).kPrimaryColor,
                      width: 1,
                    )),
            child: !isloading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (leading != null) leading!,
                      if (leading != null) SizedBox(width: 5.kw),
                      Text(
                        title,
                        style: TextStyleUtil.genSans400(
                          color: !outline
                              ? Colors.white
                              : ColorUtil(context).kPrimaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      if (trailing != null) SizedBox(width: 5.kw),
                      if (trailing != null) trailing!,
                    ],
                  )
                : CircularProgressIndicator(
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Ink(
              width: double.infinity,
              height: 48.kh,
            ),
          ),
        ),
      ],
    );
  }
}
