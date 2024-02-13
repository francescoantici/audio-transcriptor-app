import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:audio_transcriptor_app/utils/ui_utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioRecordListItem extends ConsumerWidget with UiDimension, UiShape, UiUtility {
  const AudioRecordListItem({required this.record, super.key});

  final AudioRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: roundedShape,
      child: Padding(
        padding: mediumPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Testo originale (${record.sourceLanguage})',
              style: context.textTheme.titleMedium.withBold,
            ),
            Text(record.originalText.trim()),
            smallDivider,
            Text(
              'Testo tradotto (${record.targetLanguage})',
              style: context.textTheme.titleMedium.withBold,
            ),
            Text(record.translatedText.trim()),
            smallDivider,
            Text(
              'Keywords',
              style: context.textTheme.titleMedium.withBold,
            ),
            smallDivider,
            Wrap(
              spacing: UiDimension.smallSize,
              runSpacing: UiDimension.smallSize,
              children: [
                for (final keyword in record.keywords)
                  Chip(
                    label: Text(keyword),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
