import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prestapyme/src/data/apis/get_articles_service.dart';
import 'package:test_prestapyme/src/domain/models/articles/response_get_list_articles_model.dart';
import 'package:test_prestapyme/src/ui/articles/widgets/banner_articles_widget.dart';
import 'package:test_prestapyme/src/ui/articles/widgets/card_of_articles_widget.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';

class ArticlesPage extends StatefulWidget {
  final Size size; 
  const ArticlesPage({super.key, required this.size});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {

  ScrollController scrollController = ScrollController();
  bool isloadingData = false;
  int lengthOfListpaginationArticles = 0;

  Future addArticles ()async{
    final GetArticlesService getArticlesService  = Provider.of<GetArticlesService>(context, listen: false);

    if(mounted){
      setState(() {
        isloadingData = true;
      }); 
      getArticlesService.paginationArticles += 1; 
      
      ResponseGetListArticles listOfArticles = await getArticlesService.getListArticlesServicewithPagination(
        getArticlesService.paginationArticles.toString()
      ); 

      setState(() {
        lengthOfListpaginationArticles = listOfArticles.data!.length;
      });

      if(listOfArticles.data!.isNotEmpty ){
        getArticlesService.addArticles(listOfArticles.data!);
        moveScrollToBotton();
      }

      setState(() {
        isloadingData = false;
      });
      
    }
  }

  void moveScrollToBotton (){
    if(scrollController.position.pixels + 50 <= scrollController.position.maxScrollExtent) return; 
    scrollController.animateTo(
      scrollController.position.pixels + 140, 
      duration: const Duration(milliseconds: 800), 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    final GetArticlesService getArticlesService = Provider.of<GetArticlesService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const SizedBox(
          height: 25.0,
          child: Image(
            image: AssetImage("lib/src/assets/logo_cambio_seguro_white.png")
          ),
        ),
      ),
      body: (getArticlesService.statusCode != 200 && getArticlesService.loadingGetInfo == false)?
      const Center(
        child: SizedBox(
          width: 200.0,
          child: TextCustomWidget(
              text: "Hubo un error al traer la información", 
              fontWeight: FontWeight.bold, 
              color: Colors.black, 
              fontSize: 16.0,
              useTextOverFlow: false,
              textAlign: TextAlign.center,
            ),
        ),
      )
      
      :
      (getArticlesService.loadingGetInfo == true) ?
        const Center(
          child: SizedBox(
            height: 50.0,width: 50.0,
            child: Center(
              child: CircularProgressIndicator(
                color: backgroundColor,
              ),
            ),
          ),
        )
      :
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.00),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 10.0),
                BannerToArticlesList(
                  title: getArticlesService.responseGetListArticles.banner!.title,
                  subTitle: "",
                  urlImage: getArticlesService.responseGetListArticles.banner!.urlImage ,
                ),
                const SizedBox(height: 10.0),
                const Divider(
                  color: Colors.black,
                  height: 2,
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: AbsorbPointer(
                    absorbing: (isloadingData == true)?  true:false,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount:getArticlesService.listGetArticlesOfResponse.length,
                      itemBuilder: (context,index){
                         scrollController.addListener(() async{
                           if(((scrollController.position.pixels + 300 ) >=  scrollController.position.maxScrollExtent) && getArticlesService.listOfArticlesWithPaginationAndFirtsLoad >= 10){
                             if(isloadingData == false){
                               await addArticles();
                             }
                             else if( isloadingData ==true){
                              return;
                             }
                           }
                         });
                        return CardOfArticles(
                          getArticlesService: getArticlesService,
                          dateOfArticle:" ${getArticlesService.listGetArticlesOfResponse[index].createdAt.day}-${getArticlesService.listGetArticlesOfResponse[index].createdAt.month}-${getArticlesService.listGetArticlesOfResponse[index].createdAt.year}",
                          descriptionArticle: getArticlesService.listGetArticlesOfResponse[index].shortDescription,
                          titleArticle: getArticlesService.listGetArticlesOfResponse[index].title,
                          urlImageArticle:getArticlesService.listGetArticlesOfResponse[index].urlImage ,
                        );
                      }
                    ),
                  )
                )
              ],
            ),
            Align(
             alignment: Alignment.bottomCenter,
             child: Visibility(
               visible: (isloadingData == false) ? false : true,
               child: Container(
                 height: 60.0,width: double.infinity,
                 decoration: const BoxDecoration(
                   gradient: LinearGradient(
                     colors: [
                       backgroundColor,
                       Colors.transparent,
                     ],
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                   )
                 ),
                 child: const Center(
                   child: SizedBox(
                     height: 30.0,width: 30.0,
                     child: CircularProgressIndicator(
                       color: backgroundColor,
                     ),
                   ),
                 ),
               ) 
             ),
            )
          ],
        ),
      ),
    );
  }
}
