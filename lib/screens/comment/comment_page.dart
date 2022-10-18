import 'package:elokyetu/models/gastronomia_model/post_gastronomia_widget.dart';
import 'package:elokyetu/screens/comment/comment_controller.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  final controller = CommentController.commentController;
  CommentPage(this.postCurrent, {Key? key}) : super(key: key);
  final PostGastronomiaWidget postCurrent;
  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final controller = CommentController.commentController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comentários")),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(child: widget.postCurrent),
          /*
          FutureBuilder<List<CommentModel>>(
            future: controller
                .getComments(widget.postCurrent.postGastronomiaModel.objectId!),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    /*
                    ...List.generate(
                        snapshot.data?.length ?? 0,
                        (index) => ListTile(
                            title: Text(snapshot.data?[index].name ?? ""),
                            subtitle: Text(
                              snapshot.data?[index].comment ?? "Meu Comentário",
                            )))
                    */
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ),

          */
          ...List.generate(
              20,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meu Comentário: $index",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Divider()
                      ],
                    ),
                  ))
        ]),
      ),
    );
  }
}
