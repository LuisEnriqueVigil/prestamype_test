import 'package:flutter/material.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';

class TabChangeQuoter extends StatelessWidget {
  const TabChangeQuoter({
    super.key,
    required this.quoterController,
    required this.indexQuoter,
    required this.labelOption,
    required this.mountLabel
  });

  final QuoterController quoterController;
  final int indexQuoter; 
  final String labelOption;
  final String mountLabel; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        quoterController.quoterIndex = indexQuoter; 
      },
      child: Column(
        children: [
          SizedBox(
            child: TextCustomWidget(
              text: labelOption, 
              fontWeight: FontWeight.normal,
              color:(indexQuoter == quoterController.quoterIndex)?
               labelQuoterColor:
               Colors.grey.withOpacity(0.60), 
              fontSize: 14.0
            ),
          ),
          TextCustomWidget(
              text: mountLabel, 
              fontWeight: FontWeight.normal,
              color:(indexQuoter == quoterController.quoterIndex)?
               labelQuoterColor:
               Colors.grey.withOpacity(0.60), 
              fontSize: 14.0
          ),
          Container(
            height: 5.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: (indexQuoter == quoterController.quoterIndex)?
              backgroundColor:
              Colors.transparent
            ),
          )
        ],
      ),
    );
  }
}
