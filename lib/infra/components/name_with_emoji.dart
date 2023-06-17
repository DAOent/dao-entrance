import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';

// ignore: must_be_immutable
class WidgetUserNameEmoji extends StatelessWidget {
  final String name;
  String? emoji;
  WidgetUserNameEmoji(
    this.name,
    String? emoji, {
    super.key,
  });

  @override
  Widget build(BuildContext ctx) {
    final parser = EmojiParser();
    final constTheme = Theme.of(ctx).extension<ExtColors>()!;

    return RichText(
      text: TextSpan(
        text: name,
        style: TextStyle(
          color: constTheme.sidebarText,
          fontWeight: FontWeight.normal,
          fontSize: 15.w,
          overflow: TextOverflow.ellipsis,
        ),
        children: [
          (emoji != null)
              ? WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(10.0, -5.0),
                    child: Text(
                      parser.emojify(emoji!).toString(),
                      style: TextStyle(fontSize: 15.w),
                    ),
                  ),
                )
              : const TextSpan(text: ''),
        ],
      ),
    );
  }
}
