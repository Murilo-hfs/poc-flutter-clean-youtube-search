import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

showErrorAlert({@required String msg, Duration duration}) {
  print('Msg: $msg');
  asuka.showSnackBar(SnackBar(
    duration: duration ?? Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
    content: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.info_outline),
        ),
        Expanded(child: Text(msg)),
      ],
    ),
  ));
}

showInfoAlert({
  @required String msg,
  Duration duration,
}) {
  print('Msg: $msg');
  asuka.showSnackBar(SnackBar(
    duration: duration ?? Duration(seconds: 2),
    backgroundColor: Colors.teal[800],
    content: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.info_outline),
        ),
        Expanded(child: Text(msg)),
      ],
    ),
  ));
}

Future<bool> showConfirmDialog({String title, @required String msg}) async {
  return await asuka.showDialog(
    builder: (context) => AlertDialog(
      title: Text("$title"),
      content: Text("$msg"),
      actions: [
        CustomButton(
          label: 'Cancelar',
          height: 40,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        CustomButton(
          label: 'Confirmar',
          height: 40,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    ),
  );
}

showAlertDialog({String title, @required String msg, bool showActions}) {
  print('Msg: $msg');
  asuka.showDialog(
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: const EdgeInsets.all(0),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 15),
                        child: Icon(
                          Icons.info,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        msg,
                        style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                showActions != null && showActions
                    ? Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Divider(
                                color: Theme.of(context).canvasColor,
                              ),
                              _customButton(
                                context,
                                text: 'While using the app',
                                action: () => print('botao1'),
                              ),
                              Divider(
                                color: Theme.of(context).canvasColor,
                              ),
                              _customButton(
                                context,
                                text: 'Only this time',
                                action: () => print('botao2'),
                              ),
                              Divider(
                                color: Theme.of(context).canvasColor,
                              ),
                              _customButton(
                                context,
                                text: 'Deny',
                                action: () => print('botao3'),
                              ),
                            ]),
                      )
                    : Container()
              ],
            ),
            actions: <Widget>[
              _actionButton(
                name: 'Ok',
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
}

Widget _customButton(BuildContext context, {Function action, String text}) {
  return InkWell(
    child: Container(
      height: 45,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ),
    onTap: action,
  );
}

Widget _actionButton({@required String name, @required Function onPressed}) {
  return ElevatedButton(
    child: Text(name),
    onPressed: onPressed,
  );
}

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final double height;
  final Color color;
  final bool enabled;

  const CustomButton(
      {@required this.onPressed,
      @required this.label,
      this.height = 45,
      this.color,
      this.enabled = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: !enabled
              ? null
              : color != null
                  ? color
                  : Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onPressed: enabled ? onPressed : null,
        child: Text(label ?? ''),
      ),
    );
  }
}
