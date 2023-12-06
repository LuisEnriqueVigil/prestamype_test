
import 'package:flutter/material.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';

class MenuButtonWidget extends StatelessWidget {
  final String labelButton; 
  final String image; 
  final VoidCallback ontap;
  
  const MenuButtonWidget({
    super.key,
    required this.size, required this.labelButton, required this.image,
    required this.ontap
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:size.width*0.85 ,
        height: 100.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0) ,
        child: Stack(
          alignment: Alignment.center,
          children:  [
            InkWell(
              onTap: ontap,
              child: Container(
                width:size.width*0.60 ,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0
                  )
                ),
                child: TextCustomWidget(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  text: labelButton,
                  textAlign: TextAlign.center,
                ),
              ),
            ) ,
             Positioned(
              left: 30.0,top: 15,
              child: SizedBox(
                height: 50.0,
                width: 55.0,
                child: Image(
                  image: AssetImage("lib/src/assets/$image.png") 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}