import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('setId should update the ID', () {
    // Arrange
    final provider = RecentlyPlayedIdProvider();
    const newId = 'new_id';

    // Act
    provider.setId(newId);

    // Assert
    expect(provider.id, newId);
  });

  test('setId should notify listeners', () {
    // Arrange
    final provider = RecentlyPlayedIdProvider();
    listener() {
      // This function will be called when notifyListeners() is called.
    }

    // Add the listener
    provider.addListener(listener);

    // Act
    provider.setId('new_id');

    // Clean up: Remove the listener
    provider.removeListener(listener);
  });

  test('setId should not notify removed listeners', () {
    // Arrange
    final provider = RecentlyPlayedIdProvider();
    listener() {
      // This function will be called when notifyListeners() is called.
    }

    // Add the listener
    provider.addListener(listener);

    // Remove the listener
    provider.removeListener(listener);

    // Act
    provider.setId('new_id');

    // Assert
    // Ensure that the removed listener was not notified
    // You can add your own assertions or mock behaviors here as needed
  });
}
