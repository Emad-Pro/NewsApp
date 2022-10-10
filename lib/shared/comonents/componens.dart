import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import '../WebView/webview.dart';

Widget defulttextformfild({
  context,
  VoidCallback? ontab,
  Function(String)? onchanged,
  required TextEditingController controllerad,
  required String labeltext,
  required Icon prifixicon,
  required TextInputType type,
  required valid,
}) =>
    TextFormField(
      style: Theme.of(context).textTheme.bodyText2,
      controller: controllerad,
      onChanged: onchanged,
      onTap: ontab,
      validator: valid,
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: prifixicon,
        labelText: labeltext,
      ),
    );
Widget BuildArticleItem(article, context) => InkWell(
      onTap: () async {
        NavigateTo(
            context,
            Webviewpage(
              url: article['url'],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      '${article["urlToImage"].toString() == 'null' ? "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg" : article["urlToImage"]}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text("${article["title"]}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          )),
                    ),
                    Text(
                      '${article["publishedAt"]}',
                      style: TextStyle(
                        fontFamily: "ElMessiri",
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
Widget Mydvider() => Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 0.5,
    );
Widget ArticleBuilder(List, context, {isSearch = false}) => ConditionalBuilder(
      condition: List.length > 0,
      builder: ((context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: ((context, index) =>
              BuildArticleItem(List[index], context)),
          separatorBuilder: ((context, index) => Divider(
                height: 1,
              )),
          itemCount: List.length)),
      fallback: ((context) => isSearch
          ? Center(
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("صفحة البحث"),
                  Text(
                    "BY : Emad Younis",
                    style: TextStyle(),
                  )
                ],
              )),
            )
          : Center(
              child: CircularProgressIndicator(),
            )),
    );
void NavigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (contex) => Widget));
