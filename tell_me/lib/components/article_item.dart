import 'package:flutter/material.dart';
import 'package:tell_me/modules/webview/webview_screen.dart';

Widget ArticleItem(article, context) => InkWell(
  onTap: (){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => WebviewScreen(url: article['url']))
    );
  },
  child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20.0,),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']}',
                       style: Theme.of(context).textTheme.bodyText1,
                       maxLines: 3,
                       overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
);