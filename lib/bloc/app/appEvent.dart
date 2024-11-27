abstract class Application_Event {
  Application_Event();
}

class TriggerAppEvent extends Application_Event {
  final int index;
  TriggerAppEvent(this.index) : super();
}
