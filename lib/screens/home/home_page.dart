// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:menu/exports.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 250.0;

    final scrollController = useScrollController();
    final isCollapsed = useState(false);
    final didAddFeedback = useState(false);
    return Scaffold(
      drawer: DrawerWidget(),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            isCollapsed.value = scrollController.hasClients &&
                scrollController.offset >
                    (expandedBarHeight - collapsedBarHeight);
            if (isCollapsed.value && !didAddFeedback.value) {
              HapticFeedback.mediumImpact();
              didAddFeedback.value = true;
            } else if (!isCollapsed.value) {
              didAddFeedback.value = false;
            }
            return false;
          },
          child: NestedScrollView(
            headerSliverBuilder: (_, __) => [
              SliverAppBar(
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                automaticallyImplyLeading: false,
                expandedHeight: expandedBarHeight,
                collapsedHeight: collapsedBarHeight,
                centerTitle: false,
                pinned: true,

                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isCollapsed.value ? 1 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        child: Image(
                          image: NetworkImage(
                              "https://randomuser.me/api/portraits/women/72.jpg"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                elevation: 0,
                backgroundColor:
                    isCollapsed.value ? Colors.white : Colors.white,
                //automaticallyImplyLeading: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(fontSize: 32),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Happy Resturant",
                                    style: TextStyle(fontSize: 32),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 100,
                                child: Image(
                                  image: CachedNetworkImageProvider(
                                      "*************imgpathURL******"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              ),
            ],
            body: ListItems(),
          ),
        ),
      ),
    );
  }
}
