class MedecinsEcran extends StatefulWidget {
  const MedecinsEcran({Key? key}) : super(key: key);

  @override
  _MedecinEcranState createState() => _MedecinEcranState();
}

class _MedecinEcranState extends State<MedecinsEcran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Center(
            child: Text('GSB - Listes des médecins'),
          )),

      body: Card(
        child: FutureBuilder<List<Medecin>>(
          future: Api().getMedecins(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Chargement...'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data![i].nom +
                          " " +
                          snapshot.data![i].prenom),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
//searchDelegate
