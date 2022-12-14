// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatImage extends StatelessWidget {
  const ChatImage({
    super.key,
    this.image,
    this.size = 40,
  });

  final String? image;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40.0),
        ),
        width: size,
        height: size,
        child: image == null
            ? const Center(child: Icon(Icons.person))
            : CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
              ),
      );
}
