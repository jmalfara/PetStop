import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/ui/login/login_entry.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/ui/core/core_viewmodel.dart';

class CoreEntry extends StatelessWidget {

  final List<Widget> screens = [
    Text("Screen1"),
    Text("Screen2"),
    Text("Screen3"),
  ];

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, CoreViewModel>(
        converter: (Store<AppState> store) => CoreViewModel.create(store),
        builder: (BuildContext context, CoreViewModel viewModel) => Scaffold(
              appBar: AppBar(
                title: Icon(Icons.add),
              ),
              body: screens[viewModel.currentTabIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: viewModel.currentTabIndex,
                onTap: viewModel.onNavigateToTab,
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.rss_feed),
                    title: new Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.bookmark),
                    title: new Text('Messages'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      title: Text('Profile'))
                ],
              ),
            ));
  }
}
