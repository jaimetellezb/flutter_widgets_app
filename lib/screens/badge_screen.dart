import 'package:flutter/material.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({super.key});

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  bool activeMessage = true;
  int index = -1;
  int emailCount = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Screen'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Badge(child: Icon(Icons.notifications_none_outlined)))
        ],
      ),
      body: index == 0
          ? const Center(
              child: Text('Mensajes'),
            )
          : index == 1
              ? const Center(
                  child: Text('Correos'),
                )
              : const Center(
                  child: Text('Perfil'),
                ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 0) {
              activeMessage = !activeMessage;
            }
            if (index == 1) {
              emailCount--;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Mensaje',
            icon: Badge(
              isLabelVisible: activeMessage,
              child: const Icon(Icons.message_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Correo',
            icon: Badge.count(
              count: emailCount,
              child: const Icon(Icons.email_outlined),
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Perfil',
            icon: Badge(
              child: Icon(Icons.person_outline),
            ),
          ),
        ],
      ),
    );
  }
}
