// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_community_chat_interface/flutter_community_chat_interface.dart';
import 'package:flutter_community_chat_view/flutter_community_chat_view.dart';
import 'package:flutter_community_chat_view/src/components/chat_image.dart';

class ChatOptions {
  const ChatOptions({
    this.newChatButtonBuilder = _createNewChatButton,
    this.messageInputBuilder = _createMessageInput,
    this.chatRowContainerBuilder = _createChatRowContainer,
    this.imagePickerContainerBuilder = _createImagePickerContainer,
    this.closeImagePickerButtonBuilder = _createCloseImagePickerButton,
    this.scaffoldBuilder = _createScaffold,
    this.userAvatarBuilder = _createUserAvatar,
  });

  final ButtonBuilder newChatButtonBuilder;
  final TextInputBuilder messageInputBuilder;
  final ContainerBuilder chatRowContainerBuilder;
  final ContainerBuilder imagePickerContainerBuilder;
  final ButtonBuilder closeImagePickerButtonBuilder;
  final ScaffoldBuilder scaffoldBuilder;
  final UserAvatarBuilder userAvatarBuilder;
}

Widget _createNewChatButton(
  BuildContext context,
  VoidCallback onPressed,
  ChatTranslations translations,
) =>
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: Text(translations.newChatButton),
      ),
    );

Widget _createMessageInput(
  TextEditingController textEditingController,
  Widget suffixIcon,
  ChatTranslations translations,
) =>
    TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: translations.messagePlaceholder,
        suffixIcon: suffixIcon,
      ),
    );

Widget _createChatRowContainer(
  Widget chatRow,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10.0,
      ),
      child: chatRow,
    );

Widget _createImagePickerContainer(
  Widget imagePicker,
) =>
    Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.black,
      child: imagePicker,
    );

Widget _createCloseImagePickerButton(
  BuildContext context,
  VoidCallback onPressed,
  ChatTranslations translations,
) =>
    ElevatedButton(
      onPressed: onPressed,
      child: Text(
        translations.cancelImagePickerBtn,
      ),
    );

Scaffold _createScaffold(
  AppBar appbar,
  Widget body,
) =>
    Scaffold(
      appBar: appbar,
      body: body,
    );

Widget _createUserAvatar(
  ChatUserModel user,
  double size,
) =>
    ChatImage(
      image: user.imageUrl,
      size: size,
    );

typedef ButtonBuilder = Widget Function(
  BuildContext context,
  VoidCallback onPressed,
  ChatTranslations translations,
);

typedef TextInputBuilder = Widget Function(
  TextEditingController textEditingController,
  Widget suffixIcon,
  ChatTranslations translations,
);

typedef ContainerBuilder = Widget Function(
  Widget child,
);

typedef ScaffoldBuilder = Scaffold Function(
  AppBar appBar,
  Widget body,
);

typedef UserAvatarBuilder = Widget Function(
  ChatUserModel user,
  double size,
);
