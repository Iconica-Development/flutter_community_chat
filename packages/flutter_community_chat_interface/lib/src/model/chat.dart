// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter_community_chat_interface/src/model/chat_message.dart';

abstract class ChatModel {
  ChatModel({
    this.id,
    this.messages = const [],
    this.lastUsed,
    this.lastMessage,
  });

  String? id;
  List<ChatMessageModel>? messages;
  DateTime? lastUsed;
  ChatMessageModel? lastMessage;
}
