import 'package:flutter/material.dart';

/// Clase Screen para widget listTile
class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile Screen'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text('Contenido principal'),
            subtitle: const Text('Contenido secundario'),
            leading: const Icon(Icons.circle),
            trailing: const Icon(Icons.more_vert),
            shape: const CircleBorder(),
            iconColor: Colors.green,
            textColor: Colors.black54,
            titleTextStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            subtitleTextStyle: const TextStyle(fontStyle: FontStyle.italic),
            contentPadding: const EdgeInsets.all(10),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Acción al ejecutar onTap'),
                ),
              );
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Acción al dejar presionado el widget onLongPress'),
                ),
              );
            },
            splashColor: Colors.amber,
          ),
          const ListTile(
            title: Text('Contenido deshabilitado'),
            subtitle: Text('Contenido secundario'),
            leading: Icon(Icons.circle),
            trailing: Icon(Icons.more_vert),
            enabled: false,
          ),
          const ListTile(
            title: Text('Contenido principal'),
            subtitle: Text('Contenido secundario'),
            leading: Icon(Icons.circle),
            trailing: Icon(Icons.more_vert),
            selected: true,
          ),
          const ListTile(
            iconColor: Colors.red,
            title: Text('Contenido principal'),
            subtitle: Text('Contenido secundario'),
            leading: Icon(Icons.circle),
            trailing: Icon(Icons.more_vert),
            titleAlignment: ListTileTitleAlignment.top,
          ),
          const Card(
            child: ListTile(
              title: Text('Título dentro de una Card'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('Título dentro de una Card'),
              subtitle: Text('subtítulo dentro de una card'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('1'),
              ),
              title: Text('Título dentro de una Card'),
              subtitle: Text('title - subtitle - leading'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('2'),
              ),
              title: Text('Título dentro de una Card'),
              subtitle: Text('title - subtitle - leading - trailing'),
              trailing: Icon(Icons.arrow_circle_right),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
