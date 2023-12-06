import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';

class InputChangeMoney extends StatelessWidget {
  final String labelthisInput ;
  final String  labelToMount;
  final Function(String) onChanged; 
  final bool ? isFromPurchaseInput; 
  final bool ? isFromPurchaseOutpu; 
  final bool ? isFromSaleInput; 
  final bool ? isFromSaleOutput; 
  final String currency;

  const InputChangeMoney({
    required this.labelthisInput,
    required this.labelToMount,
    required this.onChanged,
    required this.currency,
    this.isFromPurchaseInput = false,
    this.isFromPurchaseOutpu = false,
    this.isFromSaleInput = false,
    this.isFromSaleOutput = false,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final QuoterController quoterController = Provider.of<QuoterController>(context);

    return Container(
      width: 400,
      height: 60.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: backgroundColor,
          width: 0.8
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60.0,width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.30)
            ),
            child:  Center(
              child: TextCustomWidget(
                text: labelthisInput, 
                fontWeight: FontWeight.normal, 
                color: labelQuoterColor, 
                fontSize: 14,
                useTextOverFlow: false,
                textAlign:  TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          TextCustomWidget(
            text: currency, 
            fontWeight: FontWeight.normal, 
            color: labelQuoterColor, 
            fontSize: 14,
            useTextOverFlow: false,
            textAlign:  TextAlign.center,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustomWidget(
                    text: labelToMount, 
                    fontWeight: FontWeight.normal, 
                    color: labelQuoterColor, 
                    fontSize: 12,
                    useTextOverFlow: false,
                    textAlign:  TextAlign.center,
                  ),
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black, 
                      onChanged: onChanged,
                      decoration:  InputDecoration.collapsed(
                       hoverColor: Colors.white,
                       focusColor: Colors.white , 
                       hintText: (isFromPurchaseInput == true)?
                        quoterController.inputMountCompra.toStringAsFixed(3)
                        :
                        (isFromPurchaseOutpu == true)?
                        quoterController.outputMountCompra.toStringAsFixed(3)
                        :
                        (isFromSaleInput == true)?
                        quoterController.inputMountVenta.toStringAsFixed(3)
                        :
                        quoterController.outputMountVenta.toStringAsFixed(3),
                       hintStyle: GoogleFonts.poppins(
                         color: Colors.black,
                         fontSize: 14.0,
                       ), 
                       ),
                     ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}