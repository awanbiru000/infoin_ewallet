import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemBTT extends StatelessWidget {
  final String? text;
  final String? svgPath;
  final VoidCallback onTap;

  const MenuItemBTT({
    super.key,
    this.text,
    this.svgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: svgPath != null ? _buildSvgContent() : _buildTextContent(),
        ),
      ),
    );
  }

  Widget _buildSvgContent() {
    return SvgPicture.asset(
      svgPath!,
      width: 50,
      height: 50,
    );
  }

  Widget _buildTextContent() {
    return Text(text!);
  }
}
