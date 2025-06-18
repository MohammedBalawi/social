import '../../../models/message/message_model.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class MessagesState {
  final List<MessageModel> inboxMessages;
  final List<MessageModel> outboxMessages;
  final bool isLoading;

  MessagesState({
    required this.inboxMessages,
    required this.outboxMessages,
    required this.isLoading,
  });

  factory MessagesState.initial() => MessagesState(
    inboxMessages: [],
    outboxMessages: [],
    isLoading: true,
  );

  MessagesState copyWith({
    List<MessageModel>? inboxMessages,
    List<MessageModel>? outboxMessages,
    bool? isLoading,
  }) {
    return MessagesState(
      inboxMessages: inboxMessages ?? this.inboxMessages,
      outboxMessages: outboxMessages ?? this.outboxMessages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesState.initial());

  Future<void> loadMessages() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1)); // simulate network

    final String jsonString = await rootBundle.loadString('assets/json/messages.json');
    final data = json.decode(jsonString);

    List<MessageModel> inbox = List<Map<String, dynamic>>.from(data['inbox'])
        .map((json) => MessageModel.fromJson(json))
        .toList();

    List<MessageModel> outbox = List<Map<String, dynamic>>.from(data['outbox'])
        .map((json) => MessageModel.fromJson(json))
        .toList();

    emit(MessagesState(
      inboxMessages: inbox,
      outboxMessages: outbox,
      isLoading: false,
    ));
  }
}
