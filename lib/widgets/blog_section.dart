import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/widgets/section_header.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  static const _articleUrl = 'https://www.mdpi.com/2227-7080/14/3/148';
  static const _profileUrl = 'https://sciprofiles.com/profile/harisalisafder';

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri,
          mode: LaunchMode.externalApplication, webOnlyWindowName: '_blank');
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColor.bgLight1,
            CustomColor.scaffoldBg,
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Publications",
            subtitle: "Peer-reviewed research & articles",
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: ResponsiveHelper.getMaxWidth(context)),
            child: _buildArticleCard(context, isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColor.bgCard,
            CustomColor.bgLight1,
          ],
        ),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
        boxShadow: DesignSystem.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header banner ──────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 20 : 28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [CustomColor.primary, CustomColor.gradientEnd],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DesignSystem.radiusLG),
                topRight: Radius.circular(DesignSystem.radiusLG),
              ),
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildJournalBadge(),
                      const SizedBox(height: 12),
                      _buildOpenAccessBadge(),
                    ],
                  )
                : Row(
                    children: [
                      _buildJournalBadge(),
                      const Spacer(),
                      _buildOpenAccessBadge(),
                    ],
                  ),
          ),

          // ── Body ───────────────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.all(isMobile ? 20 : 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'RhythmX™: An Interpretable Self-Supervised Contrastive Learning Framework for Heartbeat Classification',
                  style: TextStyle(
                    fontSize:
                        isMobile ? DesignSystem.fontSizeLG : DesignSystem.fontSizeXL,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 16),

                // Authors
                _buildAuthorsChip(),
                const SizedBox(height: 20),

                // Meta chips
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  children: [
                    _buildMetaChip(Icons.calendar_today_rounded,
                        'Published: 1 March 2026'),
                    _buildMetaChip(Icons.menu_book_rounded,
                        'Technologies, Vol. 14, Issue 3'),
                    _buildMetaChip(Icons.tag_rounded,
                        'DOI: 10.3390/technologies14030148'),
                  ],
                ),
                const SizedBox(height: 20),

                Divider(color: Colors.white.withOpacity(0.08), height: 1),
                const SizedBox(height: 20),

                // Abstract
                const Text(
                  'Abstract',
                  style: TextStyle(
                    fontSize: DesignSystem.fontSizeMD,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Automated ECG arrhythmia classification framework combining self-supervised contrastive pretraining '
                  '(SimCLR) with ensemble-based supervised classification. Uses a hybrid model of convolutional encoders '
                  'and tree-based models for multiclass heartbeat classification. Achieves macro-F1 scores of 0.91–0.94 '
                  'on external validation datasets (PTB-XL, Chapman–Shaoxing, INCART) with class-wise precision and '
                  'recall between 0.99–0.999. Validated by three board-certified cardiologists with 96% agreement.',
                  style: TextStyle(
                    fontSize: DesignSystem.fontSizeSM,
                    color: CustomColor.textSecondary,
                    height: 1.65,
                  ),
                ),
                const SizedBox(height: 20),

                // Keywords
                _buildKeywords(),
                const SizedBox(height: 24),

                // Action buttons
                isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildReadButton(),
                          const SizedBox(height: 12),
                          _buildCiteButton(),
                        ],
                      )
                    : Row(
                        children: [
                          _buildReadButton(),
                          const SizedBox(width: 12),
                          _buildCiteButton(),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJournalBadge() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              const Icon(Icons.article_rounded, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MDPI — Technologies',
              style: TextStyle(
                fontSize: DesignSystem.fontSizeMD,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              'Peer-Reviewed Journal',
              style: TextStyle(
                  fontSize: DesignSystem.fontSizeSM, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOpenAccessBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock_open_rounded, color: Colors.white, size: 14),
          SizedBox(width: 6),
          Text(
            'Open Access',
            style: TextStyle(
              fontSize: DesignSystem.fontSizeSM,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorsChip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: CustomColor.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
            color: CustomColor.primary.withOpacity(0.2), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.people_alt_rounded,
              size: 16, color: CustomColor.primary.withOpacity(0.8)),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Abdullah  ·  Zulaikha Fatima  ·  Haris Ali Safder  ·  Mubasher Manzoor  ·  '
              'Carlos G. Sánchez-Mejorada  ·  Miguel J. Torres Ruiz  ·  Rolando Quintero Téllez',
              style: TextStyle(
                fontSize: DesignSystem.fontSizeSM,
                color: CustomColor.primary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: CustomColor.textMuted),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(
                  fontSize: DesignSystem.fontSizeSM,
                  color: CustomColor.textMuted)),
        ],
      ),
    );
  }

  Widget _buildKeywords() {
    const keywords = [
      'ECG Classification',
      'Contrastive Learning',
      'SimCLR',
      'Random Forest',
      'Self-Supervised',
      'SHAP',
      'Grad-CAM',
      'Arrhythmia',
      'Clinical AI',
      'Ensemble Learning',
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: keywords.map((kw) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: CustomColor.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            kw,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: CustomColor.primary,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReadButton() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [CustomColor.primary, CustomColor.gradientEnd],
        ),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
      ),
      child: ElevatedButton.icon(
        onPressed: () => _launchURL(_articleUrl),
        icon: const Icon(Icons.open_in_new_rounded,
            size: 16, color: Colors.white),
        label: const Text(
          'Read Full Article',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
        ),
      ),
    );
  }

  Widget _buildCiteButton() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: TextButton.icon(
        onPressed: () => _launchURL(_profileUrl),
        icon: Icon(Icons.person_rounded,
            size: 16, color: CustomColor.textSecondary),
        label: Text(
          'SciProfiles',
          style: TextStyle(
              fontSize: 13, color: CustomColor.textSecondary),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
        ),
      ),
    );
  }
}
