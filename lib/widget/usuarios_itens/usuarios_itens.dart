// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:elokyetu/data/abel/usuario_list.dart';

import '../../screens/salas/gastronomia/category/detalhe_personal.dart';
//import 'package:kyetu/screens/categorias/gastronomia/detalhe_personal.dart';

class UsuarioItem extends StatelessWidget {
  final Usuario usuario;
  UsuarioItem(this.usuario);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => DetalhePersonal(usuario),
              ),
            );
          },
          child: Image.network(
            usuario.urlImage,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.blue.withOpacity(0.5),
          title: Text(
            usuario.nome,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
