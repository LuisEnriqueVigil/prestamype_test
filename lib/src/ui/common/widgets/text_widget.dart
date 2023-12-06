import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCustomWidget extends StatelessWidget {
  final FontWeight fontWeight; 
  final String  text; 
  final Color color; 
  final double fontSize; 
  final TextAlign? textAlign;
  final TextOverflow ? textOverflow;
  final bool ? useTextOverFlow ;

  const TextCustomWidget({
    required this.text,
    required this.fontWeight,
    required this.color,
    required this.fontSize,
    this.textOverflow =TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.useTextOverFlow = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (useTextOverFlow == true) ?
    Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    ):
    Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
    );
  }
}
