import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class DocumentDashboardPage extends StatelessWidget {
  const DocumentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Document Management',
      subtitle: 'Manage enterprise documents, files and document workflows.',
      icon: Icons.folder_open_outlined,
      kpis: [
        ModuleKpi(
          title: 'Total Documents',
          value: '18,642',
          icon: Icons.description_outlined,
        ),
        ModuleKpi(
          title: 'Recent Uploads',
          value: '284',
          icon: Icons.upload_file_outlined,
        ),
        ModuleKpi(
          title: 'Shared Documents',
          value: '1,426',
          icon: Icons.share_outlined,
        ),
        ModuleKpi(
          title: 'Pending Review',
          value: '36',
          icon: Icons.pending_actions_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Document Repository',
          icon: Icons.folder_outlined,
          route: AppRoutes.documentRepository,
        ),
        ModuleQuickAction(
          title: 'Versioning',
          icon: Icons.history_outlined,
          route: AppRoutes.documentVersioning,
        ),
        ModuleQuickAction(
          title: 'Upload / Download',
          icon: Icons.cloud_upload_outlined,
          route: AppRoutes.documentUploadDownload,
        ),
        ModuleQuickAction(
          title: 'Access Control',
          icon: Icons.lock_outline,
          route: AppRoutes.documentAccessControl,
        ),
        ModuleQuickAction(
          title: 'Document Templates',
          icon: Icons.description_outlined,
          route: AppRoutes.documentTemplates,
        ),
        ModuleQuickAction(
          title: 'Tagging & Search',
          icon: Icons.local_offer_outlined,
          route: AppRoutes.documentTaggingSearch,
        ),
        ModuleQuickAction(
          title: 'Retention Policies',
          icon: Icons.policy_outlined,
          route: AppRoutes.documentRetentionPolicies,
        ),
        ModuleQuickAction(
          title: 'OCR Integration',
          icon: Icons.document_scanner_outlined,
          route: AppRoutes.documentOcrIntegration,
        ),
      ],
    );
  }
}
