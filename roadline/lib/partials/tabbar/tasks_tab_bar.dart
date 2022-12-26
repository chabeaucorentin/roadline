import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class TasksTabBar extends StatefulWidget {
  const TasksTabBar({super.key});

  @override
  State<TasksTabBar> createState() => _TasksTabBarState();
}

class _TasksTabBarState extends State<TasksTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultElementSpacing,
        right: kDefaultElementSpacing,
        bottom: kDefaultPadding,
      ),
      color: kDarkBackgroundColor,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.0),
        decoration: const BoxDecoration(
          color: kTabBarBackgroundColor,
          borderRadius: kTabBarSelectedBorderRadius,
        ),
        height: 37.5,
        constraints: const BoxConstraints(
          maxWidth: kMainMaxWidth,
        ),
        child: TabBar(
          tabs: const <Tab>[
            Tab(text: 'Toutes'),
            Tab(text: 'En cours'),
            Tab(text: 'En retard'),
            Tab(text: 'Terminées'),
          ],
          controller: _tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: kTabBarSelectedBackgroundColor,
            border: Border.all(
              color: kTabBarBorderColor.withOpacity(0.04),
              width: 1.0,
            ),
            borderRadius: kBorderRadius,
          ),
          labelColor: kTabBarSelectedLabelColor,
          labelStyle: const TextStyle(
            fontSize: kTabBarLabelFontSize,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelColor: kTabBarLabelColor,
        ),
      ),
    );
  }
}
