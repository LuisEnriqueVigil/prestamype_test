import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prestapyme/src/data/apis/get_articles_service.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/articles/pages/articles_page.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/dollarQuoter/pages/dollar_quoter_page.dart';
import 'package:test_prestapyme/src/ui/menu/widgets/menu_button_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    final GetArticlesService getArticlesService = Provider.of<GetArticlesService>(context);
    final QuoterController quoterController = Provider.of<QuoterController>(context);     
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuButtonWidget(
            ontap: (){
              quoterController.purchasePrice = 3.9240;
              quoterController.salePrice = 3.9450;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  DollarQuoterPage(size: size,) ));
            },
            size: size,
            image: "dinero",
            labelButton: "Cotizar dólares",
          ),
          const SizedBox(height: 20.0),
          MenuButtonWidget(
            ontap: ()async{
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticlesPage(size: size)));
              getArticlesService.responseGetListArticles  = await getArticlesService.getListArticlesService(
                "1"
              );
              getArticlesService.listGetArticlesOfResponse = getArticlesService.responseGetListArticles.data!;
              getArticlesService.loadingGetInfo  = false;
            },
            size: size,
            image: "papel",
            labelButton: "Ver artículos",
          ),
        ],
      ),
    );
  }
}
