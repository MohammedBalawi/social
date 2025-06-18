import 'package:marrige_app/models/structure/tab_bar/messages/messages_all_response.dart';

class MessagesAllState {
  final bool noData;
  final List<MessagesAllData> messages;

  MessagesAllState({
    required this.noData,
    required this.messages,
  });

  factory MessagesAllState.initial() => MessagesAllState(noData: false, messages: []);
}