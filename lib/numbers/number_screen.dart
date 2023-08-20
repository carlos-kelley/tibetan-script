import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/number/number.dart';
import 'package:tibetan_script/models/number/number_service.dart';
import 'package:tibetan_script/numbers/number_detail_screen.dart';
import 'package:flutter/services.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final futureNumbers = NumberService.getNumbers();

    return SafeArea(
      child: FutureBuilder<List<Number>>(
        future: futureNumbers,
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
            final numbers = snapshot.data!;

            return SafeArea(
              child: CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 130),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(top: 40, bottom: 10),
                        child: Text(
                          'Numbers',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 20,
                          children: numbers.map((number) {
                            return GestureDetector(
                              onTap: () {
                                HapticFeedback.mediumImpact();
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        NumberDetailScreen(number: number),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(number.tibetan.toString(),
                                      style: const TextStyle(fontSize: 40)),
                                  const SizedBox(width: 50),
                                  Text(number.ipa.toString(),
                                      style: const TextStyle(fontSize: 20)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
