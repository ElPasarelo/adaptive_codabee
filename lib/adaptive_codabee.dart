library adaptivecodabee;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {

  /// Check Platform
  static bool isIOS() => (Platform.isIOS);

  ///Material Design Adapted

  ///Fonction pour le scaffold adapté
  static Widget scaffold({@required String string, @required Widget body}) {
    return (isIOS()) ? iOSScaffold(string, body) : androidScaffold(string, body);
  }

  ///Fonction pour le Text adapté
  static text({@required String string, Color color, double size, TextAlign align}) {
    TextStyle style = textStyle(color: color, size: size);
    return (isIOS())
        ? iOSText(string: string, style: style, align: align)
        : androidText(string: string, style: style, align: align);
  }

  ///Fonction pour le Button adapté
  static button({@required Widget child, @required VoidCallback onPressed}) {
    return (isIOS()) ? iOSButton(child: child, onPressed: onPressed) : androidRaisedButton(child: child, onPressed: onPressed);
  }

  ///Fonction pour le Alerte adapté
  static Future alert({@required BuildContext context, @required VoidCallback callback}) {
    return showDialog(
        context: context,
      builder: (context) {
          return isIOS() ? iOSErrorAlert(context: context, onPressed: callback): androidErrorAlert(context: context, onPressed: callback);
      }
    );
  }

  ///Android Material
  ///A ne pas intégrer directement au code, mais plutot utiliser les fonctions qui s'adaptent

  /// Le Scaffold Android
  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(title: Text(string),),
      body: body,
    );
  }

  /// Text Android
  static Text androidText({@required String string, @required TextStyle style, TextAlign align}) {
    return Text(
      string,
      style: style,
    );
  }


  /// Raised Button Android
  static RaisedButton androidRaisedButton({@required Widget child, @required VoidCallback onPressed}) {
    return RaisedButton(onPressed: onPressed, child: child,);
  }

  ///Alerte Android
  static androidErrorAlert({@required BuildContext context, @required VoidCallback onPressed}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text(string: "Une erreur est apparue"),
        ],
      ),
      actions: <Widget>[
        button(child: text(string: "OK"), onPressed: onPressed)
      ],
    );
  }

  ///iOS Material
  ///A ne pas intégrer directement au code, mais plutot utiliser les fonctions qui s'adaptent

  static CupertinoPageScaffold iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(string),),
        child: body
    );
  }

  /// Text iOS
  static DefaultTextStyle iOSText({@required String string, @required TextStyle style, TextAlign align}) {
    return DefaultTextStyle(
      child: Text(string, textAlign: align ?? TextAlign.left,),
      style: style,
    );
  }

  /// Button iOS
  static CupertinoButton iOSButton({@required Widget child, @required VoidCallback onPressed}) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }


  /// Alerte iOS
  static iOSErrorAlert({@required BuildContext context, @required VoidCallback onPressed}) {
    return CupertinoAlertDialog(
      content: Column(
        children: <Widget>[
          text(string: "Erreur")
        ],
      ),
      actions: <Widget>[
        button(child: text(string: "OK"), onPressed: onPressed)
      ],
    );
  }

  ///Both Material
  ///A ne pas intégrer directement au code, mais plutot utiliser les fonctions qui s'adaptent


  ///Style de Texte qui s'intègre aux Textes iOS et Android
  static TextStyle textStyle({Color color, double size}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }

}
