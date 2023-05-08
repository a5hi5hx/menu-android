// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:menu/exports.dart';

class SloverAppbarCustom extends HookWidget implements PreferredSizeWidget {
  SloverAppbarCustom({super.key});
  final collapsedBarHeight = 60.0;
  final expandedBarHeight = 250.0;
  final scrollController = useScrollController();
  final isCollapsed = useState(false);
  final didAddFeedback = useState(false);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
      backgroundColor: isCollapsed.value ? Colors.white : Colors.white,
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
                        image: NetworkImage(
                            "https://randomuser.me/api/portraits/women/72.jpg"),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
