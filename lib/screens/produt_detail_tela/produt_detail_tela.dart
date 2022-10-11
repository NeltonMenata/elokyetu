// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:elokyetu/data/post_json.dart';
import 'package:elokyetu/data/user_json.dart';
import 'package:elokyetu/modelos/produto.dart';
import 'package:elokyetu/theme/colors.dart';

class ProductDetailTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Producto product = Provider.of<Producto>(context, listen: false);

    // final Producto product =
    //     ModalRoute.of(context)!.settings.arguments as Producto;
    final Produto product =
        ModalRoute.of(context)!.settings.arguments as Produto;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   height: 300,
            //   width: double.infinity,
            //   child: Image.network(
            //     product.imageUrl,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // SizedBox(height: 10),
            // Text(
            //   '  ${product.title}',
            //   style: TextStyle(
            //     color: Colors.grey,
            //     fontSize: 20,
            //   ),
            // ),
            // SizedBox(height: 10),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   width: double.infinity,
            //   child: Text(
            //     product.description,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            getBody(),
          ],
        ),
      ),
    );
  }
}

Widget getBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categorias",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              // histoira sobre o perfil
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFE0DF), Color(0xFFE1F6F4)],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: black,
                          size: 28,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      // foi chamada a lista de usuarios
                      children: List.generate(usersList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(usersList[index]['img']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(postsList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 288,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 1),
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              postsList[index]
                                  ['postImg'], //postar segunda imagen
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 288,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: black.withOpacity(0.25),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 288,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        postsList[index]['img'], //imagem do bk
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          postsList[index]
                                              ['name'], // nome do usuario
                                          style: TextStyle(
                                              fontSize: 15, color: white),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          postsList[index]
                                              ['time'], // hora que foi postado
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: white.withOpacity(0.8)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // Icon(
                                //   Icons.ac_unit,
                                //   color: white,
                                //   size: 20,
                                // )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 70,
                                  height: 27,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      color:
                                          Color(0xFFE5E5E5).withOpacity(0.5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: white,
                                        size: 14,
                                      ),
                                      Text(
                                        postsList[index]['like'],
                                        style: TextStyle(
                                            fontSize: 13, color: white),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 27,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      color:
                                          Color(0xFFE5E5E5).withOpacity(0.5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: white,
                                        size: 14,
                                      ),
                                      Text(
                                        postsList[index]['comment'],
                                        style: TextStyle(
                                            fontSize: 13, color: white),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 27,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      color:
                                          Color(0xFFE5E5E5).withOpacity(0.5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.share,
                                        color: white,
                                        size: 14,
                                      ),
                                      Text(
                                        postsList[index]['share'],
                                        style: TextStyle(
                                            fontSize: 13, color: white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    ),
  );
}
