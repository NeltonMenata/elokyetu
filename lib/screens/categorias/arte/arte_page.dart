import 'package:flutter/material.dart';
import 'package:elokyetu/screens/components_general_views/button_rounded_view.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:elokyetu/widget/post_arte/post_arte.dart';

class ArteView extends StatefulWidget {
  ArteView({Key? key}) : super(key: key);

  @override
  State<ArteView> createState() => _ArteViewState();
}

class _ArteViewState extends State<ArteView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: const [
            Icon(Icons.music_note_rounded),
            Text("Arte é Cultura"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              width: larguraPor(100, context),
              color: Colors.white,
              child: const Text(
                "Representa a sua identidade, \n mostrando os teus hábitos e costumes",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Arte é Cultura",
                      style: Theme.of(context).textTheme.headline6),
                  Text("Categorias",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: larguraPor(100, context), //double.infinity,
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.movie),
                              Text("Cinema",
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.photo),
                              Text("Fotografia",
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.music_note_outlined),
                              Text("Música",
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ButtonRoundedView(
              title: "Publicar",
              colorLetter: Colors.black,
              icon: Transform.rotate(
                angle: -7,
                child: const Icon(Icons.send),
              ),
              action: () {},
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(12, (index) => PostArte()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            scrollController.animateTo(0,
                duration: const Duration(seconds: 2), curve: Curves.easeIn);
          });
        },
        child: const Icon(Icons.arrow_upward_rounded),
      ),
    );
  }
}
