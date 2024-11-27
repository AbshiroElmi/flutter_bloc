

class AppState{
  int counter = 0;
  AppState({required this.counter});
}

class InitState extends AppState{
  InitState():super(counter: 0);
  
}