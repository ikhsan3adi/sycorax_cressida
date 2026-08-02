import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/sync/sync_pipeline.dart';

Future<void> runSync(int now) async {
  final db = await AppDatabase.create();
  try {
    await SyncPipeline(
      client: IptvClient(),
      channelDao: ChannelDao(db),
      feedDao: FeedDao(db),
      streamDao: StreamDao(db),
      lookupDao: LookupDao(db),
    ).run(now);
  } finally {
    await db.close();
  }
}
