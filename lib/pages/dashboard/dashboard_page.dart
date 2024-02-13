import 'package:audio_transcriptor_app/pages/dashboard/components/audio_record_list_item.dart';
import 'package:audio_transcriptor_app/pages/dashboard/controller/dashboard_page_controller.dart';
import 'package:audio_transcriptor_app/utils/builder/empty_data_builder.dart';
import 'package:audio_transcriptor_app/utils/ui_utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardPage extends ConsumerWidget with UiDimension, UiUtility {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(dashboardPageControllerProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Dashboard'),
          ),
          SliverPadding(
            padding: mediumPadding,
            sliver: records.map(
              loaded: (data) => EmptyDataWidget(
                emptyCondition: data.records.isEmpty,
                emptyPlaceholderBuilder: (context) => const SliverFillRemaining(
                  child: Center(
                    child: Text('Nessun dato presente'),
                  ),
                ),
                childBuilder: (context) => SliverList.separated(
                  itemCount: data.records.length,
                  itemBuilder: (context, index) => AudioRecordListItem(record: data.records[index]),
                  separatorBuilder: (context, _) => mediumDivider,
                ),
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
        onPressed: () => ref.read(dashboardPageControllerProvider.notifier).pickFiles(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
