import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('TabBarBloc', () {
    late TabBarBloc tabBarBloc;

    setUp(() {
      tabBarBloc = TabBarBloc();
    });

    tearDown(() {
      tabBarBloc.close();
    });

    blocTest<TabBarBloc, int>(
      'emits the provided index when setTabIndex is called',
      build: () => tabBarBloc,
      act: (bloc) => bloc.setTabIndex(2),
      expect: () => [2],
    );

    blocTest<TabBarBloc, int>(
      'emits the new index when setTabIndex is called multiple times',
      build: () => tabBarBloc,
      act: (bloc) {
        bloc.setTabIndex(2);
        bloc.setTabIndex(0);
      },
      expect: () => [2, 0],
    );

    blocTest<TabBarBloc, int>(
      'does not emit a new state if setTabIndex is called with the same index',
      build: () => tabBarBloc,
      act: (bloc) {
        bloc.setTabIndex(2);
        bloc.setTabIndex(2); // Should not emit a new state
      },
      expect: () => [2],
    );
  });
}
