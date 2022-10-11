// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:elokyetu/data/usuario_list.dart';

class DetalhePersonal extends StatelessWidget {
  final Usuario usuario;
  DetalhePersonal(this.usuario);

  @override
  Widget build(BuildContext context) {
    // final Usuario usuarios =
    //     ModalRoute.of(context)!.settings.arguments as Usuario;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes Person Chef'),
        backgroundColor: const Color(0xFF19A2B0),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(usuario.urlImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Dados Pessoais",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(usuario.nome),
                  Text(usuario.idade.toString()),
                  Text(usuario.cidade),
                  Text(usuario.estadoCivil),
                  Text(usuario.contato),
                ],
              ),
            ),
            const Divider(),
            Align(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Informações Adicionais",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(usuario.nome),
                  Text(usuario.idade.toString()),
                  Text(usuario.cidade),
                  Text(usuario.estadoCivil),
                  Text(usuario.contato),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Formação"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("x"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     // mainAxisAlignment: MainAxisAlignment.start,
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             ClipRRect(
      //               borderRadius: BorderRadius.circular(20),
      //               child: Container(
      //                 width: larguraPor(47, context),
      //                 height: larguraPor(49, context),
      //                 child: Image.asset(
      //                   'assets/imag/Delcio.jpg',
      //                   fit: BoxFit.fill,
      //                 ),
      //               ),
      //             ),
      //             // Padding(
      //             //   padding: const EdgeInsets.only(top: 00.0),
      //             //   child: Column(
      //             //     children: [
      //             Container(
      //               height: 40,
      //               width: 150,
      //               // color: Colors.blue,
      //               child: FlatButton(
      //                 onPressed: () {
      //                   // Get.to(
      //                   //   PostPage(),
      //                   //   fullscreenDialog: true, // abrir a tela como uma modal
      //                   // );
      //                 },
      //                 color: Colors.blue,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(20.0),
      //                 ),
      //                 child: Text(
      //                   'Dados Pessoas',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 14,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 15.0),
      //             Container(
      //               width: double.infinity,
      //               // height: 250,
      //               // color: Colors.blue,
      //               child: Text(
      //                 'Delcio jengue',
      //                 textAlign: TextAlign.left,
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 11,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),

// class ProduconstctDetailTela extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Usuario usuarios = ModalRoute.of(context)!.settings.arguments as Usuario;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detalhes Person Chef"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Image.network(
//                 'usuarios.urlImage',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               ' usuarios.nome',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               width: double.infinity,
//               child: Text(
//                 ' usuarios.cidade',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
 // ListTile(
            //   leading: Text('Luanda'),
            //   subtitle: Text('Luanda'),
            // ),
            // ListTile(
            //   leading: Text('Luanda'),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 1.0, bottom: 10.0),
            //   child: Text(
            //     'Luanda',
            //     textAlign: TextAlign.center,
            //   ),
            // ),