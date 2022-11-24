import 'package:flutter/material.dart';
import 'package:elokyetu/models/configuracao.dart';
import 'package:elokyetu/components/main_drawer.dart';

class SettingsScrenn extends StatefulWidget {
  final ConfigurarPais settings;
  final Function(ConfigurarPais) onSettingsChanged;
  const SettingsScrenn(this.settings, this.onSettingsChanged);

  @override
  _SettingsScrennState createState() => _SettingsScrennState();
}

class _SettingsScrennState extends State<SettingsScrenn> {
  late ConfigurarPais settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    // Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _createSwitch(
                'Francesa',
                'Só exibe refeições Francesa!',
                settings.isFranca,
                (value) => setState(() => settings.isFranca = value),
              ),
              _createSwitch(
                'Portuguesa',
                'Só exibe refeições Portuguesa!',
                settings.isPortugal,
                (value) => setState(() => settings.isPortugal = value),
              ),
              _createSwitch(
                'Angolana',
                'Só exibe refeições Angolana!',
                settings.isAngola,
                (value) => setState(() => settings.isAngola = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
