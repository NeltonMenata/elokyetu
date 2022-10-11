import 'package:flutter/material.dart';
import 'package:elokyetu/util/size/size.dart';

class PostArte extends StatelessWidget {
  PostArte(
      {Key? key,
      this.content = "Minha Publicação",
      this.imgPerfil,
      this.accountName = "Nome",
      this.accountEmail = "Email",
      this.countComment = "1",
      this.countHeart = "1"})
      : super(key: key);
  final String? imgPerfil;
  final String accountName;
  final String accountEmail;
  final String? content;
  final String countComment;
  final String countHeart;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: larguraPor(90, context),
                    child: ListTile(
                      title: Text(accountName),
                      subtitle: Text(accountEmail),
                      leading: const CircleAvatar(),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Ola Mundo\n \nSeja Um Dev\n \n The Best Programathor of World",
                  textDirection: TextDirection.ltr,
                ),
              ),
              //const Spacer(),
              Row(children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                Text(countHeart),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {},
                ),
                Text(countComment),
                const Spacer(),
                Transform.rotate(
                  angle: -7,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {},
                  ),
                )
              ])
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
