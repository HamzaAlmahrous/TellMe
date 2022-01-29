import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'article_item.dart';
import 'divider.dart';

Widget ArticleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
          condition: list.length > 0, 
          builder: (context) => 
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ArticleItem(list[index], context), 
              separatorBuilder: (context, index) => myDivider(), 
              itemCount: 10,
            ), 
            fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
          );