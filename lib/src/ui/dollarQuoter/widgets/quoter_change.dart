import 'package:flutter/material.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/dollarQuoter/widgets/tab_change_quoter.dart';
import 'package:test_prestapyme/src/ui/dollarQuoter/widgets/tab_contain_change_money_widget.dart';

class QuoterChange extends StatelessWidget {
  const QuoterChange({
    super.key,
    required this.size,
    required this.quoterController,
  });

  final Size size;
  final QuoterController quoterController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height*0.50,
      decoration:const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60.0,
            padding: const EdgeInsets.only(top:10.0),
            decoration:const  BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                TabChangeQuoter(
                  quoterController: quoterController,
                  indexQuoter: 0,
                  labelOption: "Dólar compra",
                  mountLabel: quoterController.purchasePrice.toString(),
                ),
                TabChangeQuoter(
                  quoterController: quoterController,
                  indexQuoter: 1,
                  labelOption: "Dólar venta",
                  mountLabel: quoterController.salePrice.toString(),
                ),
              ]
            ),
          ),
          Expanded(
            child:  (quoterController.quoterIndex == 0)? 
            TabContainChangeMoney(
              size: size,
              isFromBuy:true,
            ):
            TabContainChangeMoney(
              size: size, 
              isFromBuy:false,
            ),
          )
        ],
      ),
    );
  }
}
