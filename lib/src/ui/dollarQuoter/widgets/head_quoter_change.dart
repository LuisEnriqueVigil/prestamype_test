import 'package:flutter/material.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';


class HeadQuoterChange extends StatelessWidget {
  const HeadQuoterChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
         SizedBox(
          width: 100.0,
          child: TextCustomWidget(
            text: "El mejor ", 
            fontWeight: FontWeight.w700, 
            color: Colors.white, 
            fontSize: 18,
            useTextOverFlow: false,
            textAlign: TextAlign.center,
          ),
        ),
         SizedBox(
          width: 150.0,
          child: TextCustomWidget(
            text: "tipo de cambio", 
            fontWeight: FontWeight.w700, 
            color: Colors.white, 
            fontSize: 18,
            useTextOverFlow: false,
            textAlign: TextAlign.center,
          ),
        ),
         SizedBox(height: 05.0),
         SizedBox(
          width: 220.0,
          child: TextCustomWidget(
            text: "para cambiar dólares y soles online en Perú", 
            fontWeight: FontWeight.normal, 
            color: Colors.white, 
            fontSize: 14,
            useTextOverFlow: false,
            textAlign:  TextAlign.center,
          ),
        ),
      ],
    );
  }
}
