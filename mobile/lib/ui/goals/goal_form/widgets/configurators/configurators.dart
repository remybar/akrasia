// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

void showConfigurator<T extends Cubit<Object>>({
  BuildContext context,
  T value,
  Widget child,
}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (BuildContext bc) {
        return BlocProvider<T>.value(value: value, child: child);
      });
}
