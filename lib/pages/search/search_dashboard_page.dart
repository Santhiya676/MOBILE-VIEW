import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class SearchDashboardPage extends StatelessWidget {
  const SearchDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Search',
      subtitle: 'Manage global search, indexes, relevance, saved searches and suggestions.',
      icon: Icons.search_outlined,
      kpis: [
        ModuleKpi(
          title: 'Indexed Documents',
          value: '18.6M',
          icon: Icons.storage_outlined,
        ),
        ModuleKpi(
          title: 'Searches Today',
          value: '486K',
          icon: Icons.search_outlined,
        ),
        ModuleKpi(
          title: 'Active Indexes',
          value: '42',
          icon: Icons.storage_outlined,
        ),
        ModuleKpi(
          title: 'Saved Searches',
          value: '12,842',
          icon: Icons.bookmark_border_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Global Search',
          icon: Icons.search_outlined,
          route: AppRoutes.searchGlobalSearch,
        ),
        ModuleQuickAction(
          title: 'Index Management',
          icon: Icons.storage_outlined,
          route: AppRoutes.searchIndexManagement,
        ),
        ModuleQuickAction(
          title: 'Search Analytics',
          icon: Icons.analytics_outlined,
          route: AppRoutes.searchAnalytics,
        ),
        ModuleQuickAction(
          title: 'Autocomplete',
          icon: Icons.keyboard_outlined,
          route: AppRoutes.searchAutocomplete,
        ),
        ModuleQuickAction(
          title: 'Relevance Ranking',
          icon: Icons.sort_outlined,
          route: AppRoutes.searchRelevanceRanking,
        ),
        ModuleQuickAction(
          title: 'Saved Searches',
          icon: Icons.bookmark_border_outlined,
          route: AppRoutes.searchSavedSearches,
        ),
        ModuleQuickAction(
          title: 'Multi-Tenant Index',
          icon: Icons.domain_outlined,
          route: AppRoutes.searchMultiTenantIndex,
        ),
        ModuleQuickAction(
          title: 'Synonyms',
          icon: Icons.spellcheck_outlined,
          route: AppRoutes.searchSynonyms,
        ),
        ModuleQuickAction(
          title: 'Suggestion Engine',
          icon: Icons.tips_and_updates_outlined,
          route: AppRoutes.searchSuggestionEngine,
        ),
      ],
    );
  }
}
