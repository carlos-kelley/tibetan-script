import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/number.dart';
import 'package:tibetan_script/services/number_service.dart';
import 'package:tibetan_script/numbers/number_detail_screen.dart';
import 'package:flutter/services.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<List<Number>>(
        future: NumberService.getNumbers(),
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
      
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Numbers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                            children: [
                              Text(number.tibetan.toString(),
                                  style: const TextStyle(fontSize: 60)),
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
            );
          }
        },
      ),
    );
  }
}
