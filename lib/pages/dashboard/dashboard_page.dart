import 'package:audio_transcriptor_app/domain/repository/audio_record_repository.dart';
import 'package:audio_transcriptor_app/domain/usecase/upload_audio_use_case.dart';
import 'package:audio_transcriptor_app/pages/dashboard/components/audio_record_list_item.dart';
import 'package:audio_transcriptor_app/utils/builder/empty_data_builder.dart';
import 'package:audio_transcriptor_app/utils/ui_utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardPage extends ConsumerWidget with UiDimension, UiUtility {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(audioRecordsProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Dashboard'),
          ),
          SliverPadding(
            padding: mediumPadding,
            sliver: records.map(
              data: (data) => EmptyDataWidget(
                emptyCondition: data.value.isEmpty,
                emptyPlaceholderBuilder: (context) => const SliverFillRemaining(
                  child: Center(
                    child: Text('Nessun dato presente'),
                  ),
                ),
                childBuilder: (context) => SliverList.separated(
                  itemCount: data.value.length,
                  itemBuilder: (context, index) => const AudioRecordListItem(),
                  separatorBuilder: (context, _) => mediumDivider,
                ),
              ),
              error: (error) => SliverToBoxAdapter(
                child: Container(),
              ),
              loading: (_) => const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(uploadAudioUseCaseProvider).perform(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
