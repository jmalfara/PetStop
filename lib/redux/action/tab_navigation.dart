class NavigateToTabAction {
  int index;
  NavigateToTabAction(this.index);
}


int tabNavigationReducer(int prev, action) {
  if (action is NavigateToTabAction) {
    return action.index;
  }

  return prev;
}