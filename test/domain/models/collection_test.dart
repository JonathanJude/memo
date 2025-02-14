import 'package:flutter_test/flutter_test.dart';
import 'package:memo/domain/enums/memo_difficulty.dart';
import 'package:memo/domain/models/collection.dart';

void main() {
  Collection newCollection({
    int uniqueMemosAmount = 1,
    Map<MemoDifficulty, int> executionsAmounts = const {},
    int uniqueMemoExecutionsAmount = 0,
    int timeSpentInMillis = 0,
  }) {
    return Collection(
      id: 'id',
      name: 'name',
      description: 'description',
      category: 'category',
      tags: const [],
      uniqueMemosAmount: uniqueMemosAmount,
      executionsAmounts: executionsAmounts,
      uniqueMemoExecutionsAmount: uniqueMemoExecutionsAmount,
      timeSpentInMillis: timeSpentInMillis,
    );
  }

  test('Collection should not allow zero unique memos', () {
    expect(
      () {
        newCollection(uniqueMemosAmount: 0);
      },
      throwsAssertionError,
    );
  });

  test('Collection should not allow a negative amount of unique executions', () {
    expect(
      () {
        newCollection(uniqueMemoExecutionsAmount: -1);
      },
      throwsAssertionError,
    );
  });

  test('Collection should not allow a negative time spent', () {
    expect(
      () {
        newCollection(timeSpentInMillis: -1);
      },
      throwsAssertionError,
    );
  });

  test('Collection should not allow unique memos exceed the executed ones', () {
    expect(
      () {
        newCollection(uniqueMemoExecutionsAmount: 2);
      },
      throwsAssertionError,
    );
  });
}
