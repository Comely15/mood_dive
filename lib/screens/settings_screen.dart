import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../services/user_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  double _chatSpeed = 1.0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userPrefs = Provider.of<UserPreferences>(context);
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: PhosphorIcon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.cinzel(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance Section
          _buildSectionHeader(context, '테마', PhosphorIcons.palette()),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.moon(),
            title: '다크 모드',
            subtitle: '어두운 테마 사용',
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          const SizedBox(height: 24),

          // User Profile Section
          _buildSectionHeader(context, '사용자 정보', PhosphorIcons.user()),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.users(),
            title: '연령대',
            subtitle: userPrefs.ageGroupDisplay,
            trailing: PhosphorIcon(
              PhosphorIcons.caretRight(),
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            onTap: () => _showAgeGroupDialog(context, userPrefs),
          ),
          const SizedBox(height: 24),

          // Notifications Section
          _buildSectionHeader(context, '알림', PhosphorIcons.bell()),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.bellRinging(),
            title: '푸시 알림',
            subtitle: '새 메시지 알림 받기',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          const SizedBox(height: 24),

          // Chat Settings Section
          _buildSectionHeader(context, '채팅 설정', PhosphorIcons.chatCircle()),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.speedometer(),
            title: '채팅 속도',
            subtitle: 'AI 응답 속도 조절',
            trailing: SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _chatSpeed.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                  PhosphorIcon(
                    PhosphorIcons.caretRight(),
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ],
              ),
            ),
            onTap: () => _showChatSpeedDialog(context),
          ),
          const SizedBox(height: 24),

          // About Section
          _buildSectionHeader(context, '정보', PhosphorIcons.info()),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.info(),
            title: '앱 버전',
            subtitle: '1.0.0',
          ),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.question(),
            title: '도움말 및 지원',
            subtitle: '앱 사용에 대한 도움받기',
            onTap: () {
              // TODO: Navigate to help page
            },
          ),
          _buildSettingCard(
            context,
            icon: PhosphorIcons.shieldCheck(),
            title: '개인정보 처리방침',
            subtitle: '개인정보 보호 정책 보기',
            onTap: () {
              // TODO: Navigate to privacy policy
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, PhosphorIconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          PhosphorIcon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required PhosphorIconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: PhosphorIcon(
            icon,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
              )
            : null,
        trailing: trailing,
      ),
    );
  }

  void _showChatSpeedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('채팅 속도'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'AI 응답 속도를 조절하세요',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Slider(
                  value: _chatSpeed,
                  min: 0.5,
                  max: 2.0,
                  divisions: 6,
                  label: _chatSpeed.toStringAsFixed(1),
                  onChanged: (value) {
                    setDialogState(() {
                      _chatSpeed = value;
                    });
                    setState(() {
                      _chatSpeed = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '느림',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '빠름',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }

  void _showAgeGroupDialog(BuildContext context, UserPreferences userPrefs) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('연령대 선택'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '쇼핑 추천을 위한 연령대를 선택해주세요',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildAgeOption(context, userPrefs, '20s', '20대', '트렌디하고 캐주얼한 스타일'),
            _buildAgeOption(context, userPrefs, '30s', '30대', '실용적이고 세련된 스타일'),
            _buildAgeOption(context, userPrefs, '40s', '40대', '품질과 브랜드 중심'),
            _buildAgeOption(context, userPrefs, '50s', '50대', '클래식하고 편안한 스타일'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeOption(
    BuildContext context,
    UserPreferences userPrefs,
    String value,
    String label,
    String description,
  ) {
    return RadioListTile<String>(
      title: Text(label),
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
      ),
      value: value,
      groupValue: userPrefs.ageGroup,
      onChanged: (String? newValue) {
        if (newValue != null) {
          userPrefs.setAgeGroup(newValue);
          Navigator.of(context).pop();
        }
      },
    );
  }
}
