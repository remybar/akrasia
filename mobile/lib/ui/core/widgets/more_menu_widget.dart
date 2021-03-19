// Flutter imports:
import 'package:flutter/material.dart';

class MoreMenuWidget<T> extends StatelessWidget {
  final Map<T, String> menuChoices;
  final Function(T) onSelected;

  const MoreMenuWidget({Key key, this.menuChoices, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      itemBuilder: (BuildContext context) {
        return menuChoices.entries.map((entry) {
          return PopupMenuItem<T>(value: entry.key, child: Text(entry.value));
        }).toList();
      },
      onSelected: onSelected,
      child: const Icon(Icons.more_vert),
    );
  }
}
