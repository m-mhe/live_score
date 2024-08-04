import 'package:flutter/material.dart';
import 'package:live_score/entities/football.dart';

class ScoreCard extends StatelessWidget {
  final Football match;
  const ScoreCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[600],
      child: Padding(padding: const EdgeInsets.all(20),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(match.oneScore.toString(),style: Theme.of(context).textTheme.headlineLarge),
                Text(match.teamOne.toUpperCase(),style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
             Text('VS', style: Theme.of(context).textTheme.headlineLarge),
            Column(
              children: [
                Text(match.twoScore.toString(),style: Theme.of(context).textTheme.headlineLarge),
                Text(match.teamTwo.toUpperCase(),style: Theme.of(context).textTheme.headlineLarge),
              ],
            )
          ],
        ),
      ),
    );
  }
}
