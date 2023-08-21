import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/vowels/vowel_detail_screen.dart';
import 'package:tibetan_script/models/vowel.dart';
import 'package:tibetan_script/services/vowel_service.dart';
import 'package:flutter/services.dart';

class VowelScreen extends StatelessWidget {
  const VowelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      child: FutureBuilder<List<Vowel>>(
        future: VowelService.getVowels(),
        builder: (context, snapshot) {
          // handle errors and loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          } else {
            // once we have data
            final vowels = snapshot.data!;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Vowels',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 40,
                      children: vowels.map((vowel) {
                        return GestureDetector(
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    VowelDetailScreen(vowel: vowel),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Text(vowel.tibetan.toString(),
                                  style: const TextStyle(fontSize: 40)),
                              const SizedBox(width: 50),
                              Text(vowel.ipa.toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
