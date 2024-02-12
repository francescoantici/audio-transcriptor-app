import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioRecordListItem extends ConsumerWidget {
  const AudioRecordListItem({required this.record, super.key});

  final AudioRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(record.originalText),
      subtitle: Text(record.translatedText),
      trailing: IconButton(
        icon: const Icon(Icons.play_arrow),
        onPressed: () {},
      ),
    );
  }
}
