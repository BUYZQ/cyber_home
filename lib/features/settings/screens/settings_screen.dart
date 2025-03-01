import 'package:cyber_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {

  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: false,
                pinned: true,
                scrolledUnderElevation: 0,
                expandedHeight: 80,
                title: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      Text(
                        'Настройки',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      IconButton(
                        color: theme.colorScheme.surface,
                        onPressed: _signOut,
                        icon: Icon(Icons.exit_to_app),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(preferredSize: Size(10, 20), child: SizedBox()),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Text(
                            'Приложение',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 31,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset('images/settings/dark_theme.png', scale: 1.5,),
                          title: Text(
                            'Тёмная тема',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 21  ,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ListTile(
                            onTap: () {},
                            leading: Image.asset('images/settings/langue.png', scale: 1.5,),
                            title: Text(
                              'Язык',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Text(
                            'Поддержка',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 31,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset('images/settings/feetback.png', scale: 1.5,),
                          title: Text(
                            'Связаться с нами',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 21  ,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset('images/settings/politic.png', scale: 1.5,),
                          title: Text(
                            'Политика и конфедициальность',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Text(
                            'Информация о приложении',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 31,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset('images/settings/version.png', scale: 1.5,),
                          title: Text(
                            'Версия',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 21  ,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await AuthService().signOut();
      Navigator.of(context).pushNamed('/auth');
   } catch(e) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error server')));
   }
  }
}
