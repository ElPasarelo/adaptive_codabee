# Adaptive Codabee

Apprendre à créer un package qui s'adapte selon l'OS utilisé.
Ce package est destiné à la création d'applications [Flutter](https://flutter.io)

![ScreenShot](/screenshots/Screenshot_1592468219.png)

![ScreenShot](/screenshots/ios.png)

## Getting Started

Pour utiliser ce package, ajouter au `pubspec.yaml`:

```yaml
dependencies:
    adaptive_codabee: ^1.0.1
```

## Usage

Dans le fichier Dart, importez: 

```dart
import 'package:adaptive_codabee/adaptive_codabee.dart';
```

Intégrer un Scaffold

```dart 

  Widget build(BuildContext context) {
    return Adaptive.scaffold(
        string: "Notre package Importé", 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Adaptive.text(
                  string: "Notre application s'adapte automatiquement",
                  color: Colors.red,
                  size: 25,
                  align: TextAlign.center
              ),
              Adaptive.button(
                  child: Adaptive.text(string: "Press me"),
                  onPressed: () {
                    /// Effectuer une action
                    print("test");
                  }
                  ),
              Adaptive.button(
                  child: Adaptive.text(string: "Montrer l'alerte"), onPressed: () {
                    Adaptive.alert(
                        context: context,
                        callback: () {
                          Navigator.of(context).pop();
                        }
                    );
              })
            ],
          ),
        )
    );
  }
```