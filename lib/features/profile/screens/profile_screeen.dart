import 'dart:io';
import 'package:cyber_app/features/profile/widget/edit_field.dart';
import 'package:cyber_app/providers/user_image_provider.dart';
import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _fullNameController =
      TextEditingController(text: 'Котова Милана Васильевна');
  final TextEditingController _dateController =
      TextEditingController(text: '19.10.1999');
  final TextEditingController _genderController =
      TextEditingController(text: 'Женский');
  final TextEditingController _emailController =
      TextEditingController(text: 'i.svetlana@cyber-ed.ru');
  final TextEditingController _passwordController =
      TextEditingController(text: '••••••••');
  final TextEditingController _phoneController =
      TextEditingController(text: '+79244532123');

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<UserImageProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'Профиль'),
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
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Image.asset(
                          'images/home/menu.png',
                          scale: 1.8,
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
                      horizontal: 20.0, vertical: 30),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 3,
                                color: theme.colorScheme.primaryFixed,
                              ),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(100),
                              color: theme.colorScheme.surface,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: imageProvider.getImage,
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: imageProvider.image == null
                                      ? Icon(
                                          Icons.person,
                                          size: 100,
                                          color: theme.colorScheme.primaryFixed,
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.file(
                                            imageProvider.image!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: theme.colorScheme.surface,
                              ),
                              child: Image.asset(
                                'images/profile/edit.png',
                                scale: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      EditField(
                        controller: _fullNameController,
                        isEdit: true,
                      ),
                      SizedBox(height: 10),
                      EditField(
                        controller: _dateController,
                      ),
                      SizedBox(height: 10),
                      EditField(
                        controller: _genderController,
                      ),
                      SizedBox(height: 10),
                      EditField(
                        controller: _emailController,
                        isEdit: true,
                      ),
                      SizedBox(height: 10),
                      EditField(
                        controller: _passwordController,
                        isEdit: true,
                      ),
                      SizedBox(height: 10),
                      EditField(
                        controller: _phoneController,
                        isEdit: true,
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
