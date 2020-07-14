import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dialog/util/logger.dart';
import 'package:flutter/material.dart';

import '../router.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  static const routeName = '/alert';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(AlertPage.routeName)),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('OK Dialog'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (barrierDismissible: false)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                barrierDismissible: false,
              );
              assert(result == OkCancelResult.ok);
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (Custom okLabel)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'YES!',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (No Title)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                message: 'This is message.',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (No Message)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (Default: Cancel)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                defaultType: OkCancelAlertDefaultType.cancel,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (Destructive)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                isDestructiveAction: true,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (long button label)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Long OK' * 2,
                cancelLabel: 'Long Cancel' * 2,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (useActionSheetForCupertino)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                isDestructiveAction: true,
                cancelLabel: 'No!',
                useActionSheetForCupertino: true,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('Confirmation Dialog (few selections)'),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    5,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('Confirmation Dialog (many selections)'),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    20,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
                shrinkWrap: false,
              );
              logger.info(result);
            },
          ),
        ],
      ),
    );
  }
}
