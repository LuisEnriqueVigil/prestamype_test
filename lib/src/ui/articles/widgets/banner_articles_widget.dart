import 'package:flutter/material.dart';
import 'package:test_prestapyme/src/ui/common/widgets/text_widget.dart';


class BannerToArticlesList extends StatelessWidget {
  final String title;
  final String subTitle; 
  final String urlImage; 
  
  const BannerToArticlesList({
    super.key, required this.title, required this.subTitle, required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 280.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const TextCustomWidget(text: "¡Nuevo artículo!", fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 15.0),
          TextCustomWidget(
            text: title, 
            fontWeight: FontWeight.bold, 
            color: Colors.black, 
            fontSize: 18.0,
            useTextOverFlow: false,
          ),
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 150.0,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: const  AssetImage(
                    "lib/src/assets/papel.png"
                  ),
                image: NetworkImage(urlImage),
                fit: BoxFit.fitHeight,),
            ),
          ),
        ],
      ),
    );
  }
}