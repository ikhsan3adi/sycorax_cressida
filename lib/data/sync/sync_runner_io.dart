import 'dart:isolate';

import 'package:sycorax_cressida/data/sync/sync_runner_common.dart';

class SyncRunner {
  Future<void> runInBackground(int now) {
    return Isolate.run(() => runSync(now));
  }
}
