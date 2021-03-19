// Flutter imports:
import 'package:flutter/material.dart';

Future<T> showCustomBottomSheet<T>(
    {@required BuildContext context,
    @required String title,
    @required VoidCallback onValidate,
    @required Widget child}) {
  return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (BuildContext bc) {
        return CustomBottomSheet(title: title, onValidate: onValidate, child: child);
      });
}

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onValidate;

  const CustomBottomSheet({this.title, this.child, this.onValidate});

  Widget _buildInnerWidget(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        children: [
          Text(title,
              textAlign: TextAlign.left,
              style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 18)),
          const Spacer(),
          if (onValidate != null)
            TextButton(
              onPressed: onValidate,
              child: const Text("Valider", style: TextStyle(fontSize: 16)),
            )
        ],
      ),
      const Divider(),
      child
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: _buildInnerWidget(context),
      ),
    ));
  }
}
