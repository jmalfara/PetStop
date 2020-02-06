import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/ui/core/core_controller.dart';
import 'package:petstop/ui/core/home/home_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/ui/core/core_viewmodel.dart';

class CoreEntry extends StatelessWidget {

  final List<Widget> screens = [
    HomePage(),
    Text("Screen2"),
    Text("Screen3"),
  ];

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, CoreViewModel>(
        converter: (Store<AppState> store) => CoreViewModel(store),
        builder: (BuildContext context, CoreViewModel viewModel) => Scaffold(
              body: SafeArea(
                child: Container(
                  child: screens[viewModel.currentTab],
                ),
              ),
              floatingActionButton: _renderActionButton(viewModel.currentTab),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: viewModel.currentTab,
                onTap: (index) => viewModel.currentTab = index,
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.favorite),
                    title: Text("Home"),
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.account_circle),
                    title: new Text('Messages'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_today),
                      title: Text('Profile')
                  )
                ],
              ),
            ));
  }

  _renderActionButton(int currentTab) {
    if (currentTab == 0) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => controlHandleAddPetAction(),
      );
    }

    return Container();
  }
}
