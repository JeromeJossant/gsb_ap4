void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide demo banner
      debugShowCheckedModeBanner: false,
      title: 'GSB Médecins',
      routes: {
        PaysDepart.routeName: (context) => const PaysDepart(),
        DepartMedecin.routeName: (context) => const DepartMedecin(),
      },
      home: Main(),
      // Setting up the custom themes created in theme.dart
      //
      // Default theme
    );
  }
}
