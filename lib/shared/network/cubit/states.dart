abstract class AppStates {}

// Initial State
class AppInitialState extends AppStates {}

// BottomNavigationBar State
class AppBottomNavigationBarState extends AppStates {}

// Get Business Data From API State
class AppGetBusinessLoadingState extends AppStates {}

class AppGetBusinessSuccessState extends AppStates {}

class AppGetBusinessErrorState extends AppStates
{
  final String error;

  AppGetBusinessErrorState(this.error);
}

// Get Search Data From API State
class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSuccessState extends AppStates {}

class AppGetSearchErrorState extends AppStates
{
  final String error;

  AppGetSearchErrorState(this.error);
}

// Change Mode Theme of App
class AppChangeModeThemeState extends AppStates {}