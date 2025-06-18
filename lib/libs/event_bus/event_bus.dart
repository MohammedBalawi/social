import 'package:event_bus/event_bus.dart';


final EventBus eventBus = EventBus();


class ConnectionWebsocketStatusEvent {
  final bool isConnected;
  ConnectionWebsocketStatusEvent(this.isConnected);
}