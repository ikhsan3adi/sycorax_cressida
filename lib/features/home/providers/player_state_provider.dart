import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/channel.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';

final playerStateProvider = NotifierProvider<PlayerStateNotifier, PlayerState>(
  PlayerStateNotifier.new,
);

class PlayerStateNotifier extends Notifier<PlayerState> {
  @override
  PlayerState build() => const PlayerState();

  void playStream(ChannelStream stream, Channel channel) {
    state = PlayerState(currentStream: stream, channel: channel);
  }

  void stop() {
    state = const PlayerState();
  }
}

class PlayerState {
  final ChannelStream? currentStream;
  final Channel? channel;

  const PlayerState({this.currentStream, this.channel});
}
