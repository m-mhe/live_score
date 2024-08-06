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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.gamepad),
        title: Text(
          'Live Score',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
            stream: firebaseFirestore.collection('match_score').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData == false) {
                return const Center(
                  child: Text('No matches'),
                );
              }
              matchList.clear();
              for (QueryDocumentSnapshot doc in snapshot.data?.docs ?? []) {
                final String teamOne = doc.id.split('vs')[0];
                final String teamTwo = doc.id.split('vs')[1];
                matchList.insert(
                  0,
                  Football(
                    teamOne: teamOne,
                    teamTwo: teamTwo,
                    oneScore: doc.get('team_one'),
                    twoScore: doc.get('team_two'),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: matchList.length,
                  itemBuilder: (context, i) {
                    return ScoreCard(
                      match: matchList[i],
                    );
                  });
            }),
      ),
    );
  }
}
