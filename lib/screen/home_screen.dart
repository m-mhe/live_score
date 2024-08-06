import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_score/entities/football.dart';
import 'package:live_score/widgets/score_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchList = [];

  //Future operation:
  Future<void> _getMatchData() async {
    final QuerySnapshot results = await firebaseFirestore.collection(
        'match_score').get();//fetching data from firebaseFirestore
    for (QueryDocumentSnapshot match in results.docs) {
      matchList.insert(0,Football(teamOne: match.id.split('vs')[0],
          teamTwo: match.id.split('vs')[1],
          oneScore: match.get('team_one'),
          twoScore: match.get('team_two')));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getMatchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Score', style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: matchList.length,
            itemBuilder: (context, i) {
              return ScoreCard(match: matchList[i],);
            }),
      ),
    );
  }
}
