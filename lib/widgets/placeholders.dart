import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyFolderPlaceholder extends StatelessWidget {
  const EmptyFolderPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    const space = 20.0;
    final color = Colors.grey.withOpacity(0.5);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(space),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.folder_off_outlined,
              size: MediaQuery.of(context).size.width / 5,
              color: color,
            ),
            const SizedBox(height: space),
            Text(
              AppLocalizations.of(context).noFolders,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
