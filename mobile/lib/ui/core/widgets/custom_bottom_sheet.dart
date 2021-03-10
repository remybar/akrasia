import 'package:flutter/material.dart';

Future<T> showCustomBottomSheet<T>({@required BuildContext context, @required String title, @required Widget child}) {
  return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (BuildContext bc) {
        return CustomBottomSheet(title: title, child: child);
      });
}

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;

  CustomBottomSheet({this.title, this.child});

  Widget _buildInnerWidget(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        children: [
          Text(title,
              textAlign: TextAlign.left,
              style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 18)),
          Spacer(),
          FlatButton(
            child: Text("Valider", style: TextStyle(fontSize: 16)),
            onPressed: () {
//              Navigator.pop(context);
            },
          )
        ],
      ),
      Divider(),
      child
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius:
                new BorderRadius.only(topLeft: const Radius.circular(25.0), topRight: const Radius.circular(25.0))),
        child: _buildInnerWidget(context),
      ),
    ));
  }
}
