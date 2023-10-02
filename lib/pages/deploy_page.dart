import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/services/deployment.dart';
import 'package:guatinidb/widgets/logo.dart';

class DeployPage extends StatefulWidget {
  final String deployPath;

  const DeployPage(this.deployPath, {super.key});

  @override
  State<DeployPage> createState() => _DeployPageState();
}

class _DeployPageState extends State<DeployPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Deployment.deploy(widget.deployPath);
    });
  }

  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (canPop) {
          Deployment.deploymentDone.value = false;
          Deployment.error.value = false;
          back(context);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: ValueListenableBuilder(
            valueListenable: Deployment.deploying,
            builder: (_, bool isDeploying, ___) {
              canPop = !isDeploying;
              return canPop ? const BackButton() : const SizedBox();
            },
          ),
          title: Text(AppLocalizations.of(context).deployment),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const GuatiniDbLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text('${AppLocalizations.of(context).selectedPath}: ${widget.deployPath}'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).processStatus,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: Deployment.error,
                              builder: (_, bool error, ___) {
                                return error
                                    ? Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Icon(
                                              Icons.clear_rounded,
                                              size: 50.0,
                                            ),
                                          ),
                                          Text(
                                            AppLocalizations.of(context).errorDeploying,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      )
                                    : ValueListenableBuilder(
                                        valueListenable: Deployment.deploymentDone,
                                        builder: (_, bool done, ___) {
                                          return done
                                              ? Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.all(20.0),
                                                      child: Icon(
                                                        Icons.check_circle_rounded,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(context).dsDeployed,
                                                      textAlign: TextAlign.justify,
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.all(20.0),
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                      child: ValueListenableBuilder(
                                                        valueListenable: Deployment.dataSourceDeployment,
                                                        builder: (_, int state, ___) {
                                                          final done = state != Deployment.dataSourceDeploymentTotal
                                                              ? ''
                                                              : ' (${AppLocalizations.of(context).done})';
                                                          return Text(AppLocalizations.of(context).dsDecoding + done);
                                                        },
                                                      ),
                                                    ),
                                                    ValueListenableBuilder(
                                                      valueListenable: Deployment.dataSourceDeployment,
                                                      builder: (_, int state, ___) {
                                                        final value = state / Deployment.dataSourceDeploymentTotal;
                                                        return LinearProgressIndicator(value: value);
                                                      },
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                        top: 20.0,
                                                        bottom: 10.0,
                                                      ),
                                                      child: ValueListenableBuilder(
                                                        valueListenable: Deployment.filesDeploymentTotal,
                                                        builder: (_, int total, ___) {
                                                          return ValueListenableBuilder(
                                                            valueListenable: Deployment.filesDeployment,
                                                            builder: (_, int state, ___) {
                                                              final done = state != total
                                                                  ? ''
                                                                  : ' (${AppLocalizations.of(context).done})';
                                                              return Text(
                                                                  AppLocalizations.of(context).dsFileCopying + done);
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    ValueListenableBuilder(
                                                      valueListenable: Deployment.filesDeploymentTotal,
                                                      builder: (_, int total, ___) {
                                                        return ValueListenableBuilder(
                                                          valueListenable: Deployment.filesDeployment,
                                                          builder: (_, int state, ___) {
                                                            final value = state / total;
                                                            return LinearProgressIndicator(value: value);
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                        },
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100.00),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ValueListenableBuilder(
          valueListenable: Deployment.deploymentDone,
          builder: (_, bool done, ___) {
            return !done
                ? const SizedBox()
                : FloatingActionButton.extended(
                    onPressed: () {
                      if (canPop) {
                        Deployment.deploymentDone.value = false;
                        Deployment.error.value = false;
                        back(context);
                      }
                    },
                    icon: const Icon(Icons.done_rounded),
                    label: Text(AppLocalizations.of(context).done),
                  );
          },
        ),
      ),
    );
  }

  void back(BuildContext context) => Navigator.of(context).popUntil((route) => route.isFirst);
}
