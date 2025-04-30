// Flutter Durum Yönetimi
// Erciyes Üniversitesi Mühendislik Fakültesi Bilgisayar Mühendisliği
// Ders: Mobile Application Development
// Öğretim Üyesi: [Dr. Öğr. Üyesi Fehim KÖYLÜ]
// Proje Ödevi: Tema Değiştiren (dark/light) Toggle
// 1030521024 Gökalp Çataldağ
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Tema modu için ValueNotifier
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Tema Değiştirici',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = MyApp.themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tema Toggle'),
        actions: [
          Switch(
            value: isDark,
            onChanged: (value) {
              MyApp.themeNotifier.value =
                  value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Şu anki tema: ${isDark ? 'Karanlık' : 'Aydınlık'}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
