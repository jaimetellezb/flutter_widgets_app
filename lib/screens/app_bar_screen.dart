// Se crea screen para widget app-bar
import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({super.key});

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  bool _appBarOption = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _appBarOption ? AppBarWidget(context) : TabBarWidget(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _appBarOption = !_appBarOption;
          });
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}

class AppBarWidget extends StatefulWidget {
  const AppBarWidget(BuildContext context, {super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool _showPlayIcon = true;
  bool _showNotificationIcon = false;
  String _data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Screen'),
        actions: [
          _showPlayIcon
              ? buildPlayPauseButton(
                  text: 'Play selected',
                  icon: Icons.play_arrow,
                )
              : buildPlayPauseButton(
                  text: 'Pause selected',
                  icon: Icons.pause,
                ),
          _showNotificationIcon
              ? buildNotificationButton(
                  text: 'Disabled notifications',
                  icon: Icons.notifications,
                )
              : buildNotificationButton(
                  text: 'Enabled notifications',
                  icon: Icons.notifications_outlined,
                ),
          PopupMenuButton<String>(
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tap: $value')),
              );
            },
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        elevation: 5,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: Center(
        child: Text(_data),
      ),
    );
  }

  IconButtonWidget buildNotificationButton(
      {required String text, required IconData icon}) {
    return IconButtonWidget(
      icon: icon,
      text: text,
      onPressed: () {
        setState(() {
          _showNotificationIcon = !_showNotificationIcon;
          _data = text;
        });
      },
    );
  }

  IconButtonWidget buildPlayPauseButton(
      {required String text, required IconData icon}) {
    return IconButtonWidget(
      icon: icon,
      text: text,
      onPressed: () {
        setState(() {
          _showPlayIcon = !_showPlayIcon;
          _data = text;
        });
      },
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      tooltip: text,
      onPressed: onPressed,
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Screen'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined),
                text: 'News',
              ),
              Tab(
                icon: Icon(Icons.bar_chart_outlined),
                text: 'Charts',
              ),
              Tab(
                icon: Icon(Icons.account_circle_outlined),
                text: 'Accounts',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Center(
            child: Text('Home selected'),
          ),
          Center(
            child: Text('Charts selected'),
          ),
          Center(
            child: Text('Account selected'),
          ),
        ]),
      ),
    );
  }
}
