import 'package:flutter/material.dart';
import 'package:test_prestapyme/src/data/apis/get_articles_service.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';

class CardOfArticles extends StatelessWidget {
  final String titleArticle; 
  final String urlImageArticle; 
  final String descriptionArticle; 
  final String dateOfArticle; 
  
  
  const CardOfArticles({
    super.key,
    required this.getArticlesService, required this.titleArticle, required this.urlImageArticle, required this.descriptionArticle, required this.dateOfArticle,
  });

  final GetArticlesService getArticlesService;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.40),
          width: 0.8
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              TextCustomWidget(
                text:dateOfArticle, 
                fontWeight: FontWeight.normal, 
                color: Colors.black, 
                fontSize: 14.0,
                useTextOverFlow: false,
                textAlign: TextAlign.right,
               ),
            ],
          ),
          TextCustomWidget(
           text: titleArticle, 
           fontWeight: FontWeight.bold, 
           color: Colors.black, 
           fontSize: 15.0,
           useTextOverFlow: false,
           textAlign: TextAlign.start,
          ),
          Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: backgroundColor
            ),
            child:  ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  placeholder: const  AssetImage(
                    "lib/src/assets/papel.png"
                  ),
                  image: NetworkImage(urlImageArticle),
                  fit: BoxFit.fitWidth,),
              ),
          ),
          const SizedBox(height: 10.0),
          TextCustomWidget(
           text: descriptionArticle, 
           fontWeight: FontWeight.normal, 
           color: Colors.black, 
           fontSize: 12.0,
           useTextOverFlow: false,
           textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
