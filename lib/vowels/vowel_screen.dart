import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/vowel/vowel.dart';
import 'package:tibetan_script/models/vowel/vowel_service.dart';
import 'package:tibetan_script/vowels/vowel_detail_screen.dart';
import 'package:flutter/services.dart';

class VowelScreen extends StatelessWidget {
  const VowelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final futureVowels = VowelService.getVowels();

    return SafeArea(
      child: FutureBuilder<List<Vowel>>(
        future: futureVowels,
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
                  const Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 10),
                    child: Text(
                      'Vowels',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vowels.length,
                      itemBuilder: (context, index) {
                        final vowel = vowels[index];
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(vowel.tibetan,
                                  style: const TextStyle(fontSize: 46)),
                              const SizedBox(width: 80),
                              Text(vowel.ipa,
                                  style: const TextStyle(fontSize: 24)),
                            ],
                          ),
                        );
                      },
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
