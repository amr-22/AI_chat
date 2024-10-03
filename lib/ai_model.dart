import 'package:google_generative_ai/google_generative_ai.dart';

String apiKey = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

final model = GenerativeModel(
  model: 'gemini-1.5-flash',
  apiKey: apiKey,
);

Future<String> Prompeting(String prompt) async {
  // print("sssss");
  final response = await model.generateContent([Content.text(prompt)]);
  // print(response.text);
  return response.text!;
}
