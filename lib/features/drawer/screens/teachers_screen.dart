import 'package:carousel_slider/carousel_slider.dart';
import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'Преподаватели'),
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
                          'Преподаватели',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontSize: 30,
                            color: theme.colorScheme.surface,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/settings',
                            );
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
                  bottom: PreferredSize(preferredSize: Size(10, 20), child: SizedBox()),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      color: theme.colorScheme.surface,
                      child: SizedBox(
                        width: double.infinity,
                        child: CarouselSlider(
                          carouselController: _controller,
                            items: [
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: theme.colorScheme.tertiary,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: theme.colorScheme.tertiaryFixed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 300,
                              aspectRatio: 16/9,
                              viewportFraction: 0.5,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(5),
                          child: IconButton(
                            onPressed: () {
                              _controller.previousPage(
                                duration: Duration(milliseconds: 400),
                              );
                            },
                            icon: Image.asset('images/сommon/icons/left.png'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(5),
                          child: IconButton(
                            onPressed: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 400)
                              );
                            },
                            icon: Image.asset('images/сommon/icons/right.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.colorScheme.tertiary,
                        ),
                        height: 300,
                      );
                    },
                    childCount: 10,
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
