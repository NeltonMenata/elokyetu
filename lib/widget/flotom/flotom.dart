// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BuildAB extends StatefulWidget {
  @override
  _BuildABState createState() => _BuildABState();
}

class _BuildABState extends State<BuildAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    const Text(
                      'Elekyetu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Salas',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildCategory(
                      category: 'Gastronomia',
                      iconData: Icons.coffee_sharp,
                      color: Colors.blue,
                    ),
                    _buildCategory(
                      category: 'Saúde',
                      iconData: Icons.stars_outlined,
                      color: Colors.deepOrange,
                    ),
                    _buildCategory(
                      category: 'Artes',
                      iconData: Icons.attribution_outlined,
                      color: Colors.blue,
                    ),
                    _buildCategory(
                      category: 'Vida e Estilo',
                      iconData: Icons.sports_volleyball_rounded,
                      color: Colors.cyan,
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.list_alt_rounded,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildCategory({
    required String category,
    required IconData iconData,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2 * 8,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              Text(
                category,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
