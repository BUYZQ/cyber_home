import 'package:cyber_app/features/profile/widget/edit_field.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  final TextEditingController controller;

  const ProfileEditScreen({
    super.key,
    required this.controller,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
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
                        'Профиль',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/settings');
                        },
                        icon: Image.asset(
                          'images/home/settings.png',
                          scale: 1.8,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                    preferredSize: Size(10, 20), child: SizedBox()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 3,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      EditField(
                        isEdit: false,
                        readOnly: false,
                        controller: widget.controller,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: MyButton(
                          backgroundColor: theme.colorScheme.tertiary,
                          onPressed: () {},
                          title: 'Сохранить',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
