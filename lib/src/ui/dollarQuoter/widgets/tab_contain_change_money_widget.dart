import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';
import 'package:test_prestapyme/src/ui/dollarQuoter/widgets/input_change_money_widget.dart';

class TabContainChangeMoney extends StatefulWidget {
  final bool isFromBuy; 
  const TabContainChangeMoney({
    super.key,
    required this.size,
    required this.isFromBuy,
  });

  final Size size;

  @override
  State<TabContainChangeMoney> createState() => _TabContainChangeMoneyState();
}

class _TabContainChangeMoneyState extends State<TabContainChangeMoney> {

  @override
  Widget build(BuildContext context) {
    final QuoterController quoterController = Provider.of<QuoterController>(context);
    return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children:  [
       SizedBox(
         height: widget.size.height*0.25,
         child: Stack(
           children: [
             (widget.isFromBuy == true)?
             Column(
               children: [
                 InputChangeMoney(
                  currency:"\$" ,
                   isFromPurchaseInput: true,
                   labelToMount: "Envio",
                   labelthisInput: "Dólares",
                   onChanged: (valor){
                    quoterController.inputMountCompra =  double.tryParse(valor)?? 00;
                    quoterController.outputMountCompra = quoterController.inputMountCompra*quoterController.purchasePrice;
                   },
                 ),
                const  SizedBox(height: 20.0),
                 InputChangeMoney(
                  currency:"S/" ,
                  isFromPurchaseOutpu: true,
                   labelToMount: "Recibo",
                   labelthisInput: "Soles",
                   onChanged: (valor){
                    quoterController.outputMountCompra = double.tryParse(valor)?? 00;
                    quoterController.inputMountCompra = quoterController.outputMountCompra /quoterController.purchasePrice;
                   },
                 ),
               ],
             )
             :
             Column(
               children: [
                 InputChangeMoney(
                  currency: "S/",
                  isFromSaleInput: true,
                   labelToMount: "Envío",
                   labelthisInput: "Soles",
                   onChanged: (valor){
                      quoterController.inputMountVenta = double.tryParse(valor)?? 00;
                      quoterController.outputMountVenta = quoterController.inputMountVenta /quoterController.salePrice;
                   },
                 ),
                 const SizedBox(height: 20.0),
                 InputChangeMoney(
                  currency:"\$" ,
                  isFromSaleOutput: true,
                   labelToMount: "Recibo",
                   labelthisInput: "Dólares",
                   onChanged: (valor){
                      quoterController.outputMountVenta = double.tryParse(valor)?? 00;
                      quoterController.inputMountVenta = quoterController.outputMountCompra *quoterController.salePrice;
                   },
                 ),
               ],
             ),
             Align(
               alignment: Alignment.center,
               child: InkWell(
                 onTap: (){
                  quoterController.inputMountCompra = 0;
                  quoterController.inputMountVenta = 0;
                  quoterController.outputMountCompra = 0;
                  quoterController.outputMountVenta = 0;
                   if(quoterController.quoterIndex == 0){
                    quoterController.quoterIndex =1 ;
                   }
                   else{
                    quoterController.quoterIndex = 0;
                   }
                 },
                 child: Container(
                   height: 50.0,width: 50.0,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(25.0),
                     color: backgroundColor
                   ),
                   child: const Icon(
                     Icons.change_circle,
                     color: Colors.white,
                     size: 35.0,
                   ),
                 ),
               ),
             )
           ],
         ),
       ),
       const SizedBox(height: 10.0),
       InkWell(
        onTap: (){
          Navigator.pop(context);
        },
         child: Container(
           width: 400.0,
           height: 40.0,
           margin: const EdgeInsets.symmetric(horizontal: 15.0),
           decoration: BoxDecoration(
             color: backgroundColor,
             borderRadius: BorderRadius.circular(5.0),
           ),
           child:const Center(
             child:  TextCustomWidget(
               text: "Iniciar operación", 
               fontWeight: FontWeight.normal, 
               color: Colors.white, 
               fontSize: 14,
               useTextOverFlow: false,
               textAlign:  TextAlign.center,
             ),
           ),
         ),
       )
      ],
    );
  }
}
