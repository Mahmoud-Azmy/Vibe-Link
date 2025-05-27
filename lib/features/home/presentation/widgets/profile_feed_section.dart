import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vibe_link/core/helper/locale_provider.dart';
import 'package:vibe_link/core/helper/shared_pref_helper.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/generated/l10n.dart';

class ProfileFeedSection extends StatelessWidget {
  const ProfileFeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.profileBckg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(AppAssets.onB2),
                    ),
                    const SizedBox(width: 16),
                    // Name and Email
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).profileName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            S.of(context).profileEmail,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Edit Icon
                    Icon(Icons.edit, color: Colors.white70),
                  ],
                ),
              ),
            ),
            // Settings List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _ProfileListTile(title: S.of(context).settingsEmail),
                  _ProfileListTile(title: S.of(context).settingsInstagram),
                  _ProfileListTile(title: S.of(context).settingsTwitter),
                  _ProfileListTile(title: S.of(context).settingsWebsite),
                  _ProfileListTile(title: S.of(context).settingsPaypal),
                  _ProfileListTile(title: S.of(context).settingsChangePassword),
                  _ProfileListTile(title: S.of(context).settingsAboutApp),
                  _ProfileListTile(title: S.of(context).settingsTermsPrivacy),
                ],
              ),
            ),
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  SharedPrefHelper.clearAllSecuredData();
                  GoRouter.of(context).push(AppRouter.loginView);
                },
                icon: SvgPicture.asset(AppAssets.logOut),
                label: Text(S.of(context).logoutButton),
              ),
            ),
            // Locale Change Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Locale newLocale =
                      Localizations.localeOf(context).languageCode == 'ar'
                          ? const Locale('en')
                          : const Locale('ar');
                  context.read<LocaleProvider>().setLocale(newLocale);
                },
                child: Text(
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? 'English'
                      : 'العربية',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  final String title;
  const _ProfileListTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 8),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white.withOpacity(0.10),
              child: const Icon(Icons.chevron_right, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
