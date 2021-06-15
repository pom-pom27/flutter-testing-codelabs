import 'package:codebase_testing/models/favorite.dart';
import 'package:codebase_testing/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
void main() {
  group('Home Page Widget Tests -', () {
    testWidgets('when app home page run it should show listview',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.drag(find.byType(ListView), const Offset(0.0, -300));
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}
