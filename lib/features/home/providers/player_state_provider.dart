import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';

final playerStateProvider = NotifierProvider<PlayerStateNotifier, PlayerState>(
  PlayerStateNotifier.new,
);

class PlayerStateNotifier extends Notifier<PlayerState> {
  @override
  PlayerState build() => const PlayerState();

  void playStream(ChannelStream stream, String channelName) {
    state = PlayerState(currentStream: stream, channelName: channelName);
  }

  void stop() {
    state = const PlayerState();
  }
}

class PlayerState {
  final ChannelStream? currentStream;
  final String? channelName;

  const PlayerState({this.currentStream, this.channelName});
}
