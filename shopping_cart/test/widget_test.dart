import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/my_app.dart';
import 'package:shopping_cart/cart_model.dart';

void main() {
  testWidgets('Add item to cart test', (WidgetTester tester) async {
    // Build the widget with a provider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartModel(),
        child: const MyApp(),
      ),
    );

    // Wait for widget to settle
    await tester.pumpAndSettle();

    // Find the first Add button
    final addButton = find.byIcon(Icons.add).first;
    expect(addButton, findsOneWidget);

    // Tap the Add button
    await tester.tap(addButton);
    await tester.pump();

    // Navigate to cart
    final cartButton = find.byIcon(Icons.shopping_cart);
    expect(cartButton, findsOneWidget);
    await tester.tap(cartButton);
    await tester.pumpAndSettle();

    // Check if the item was added to cart
    expect(find.textContaining('Item'), findsOneWidget);
  });
}
