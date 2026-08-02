import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/sync/sync_pipeline.dart';

Future<void> runSyncWith(AppDatabase db, int now) async {
  final channelDao = ChannelDao(db);
  final feedDao = FeedDao(db);
  final streamDao = StreamDao(db);
  final lookupDao = LookupDao(db);

  await SyncPipeline(
    client: IptvClient(),
    channelDao: channelDao,
    feedDao: feedDao,
    streamDao: streamDao,
    lookupDao: lookupDao,
  ).run(now);
}
