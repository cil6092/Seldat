import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seldat/LogAnalysis/FileView.dart';
import 'dart:io';

import 'package:seldat/LogAnalysis/LogFetcher.dart';

class LogAnalysis extends StatefulWidget {
  const LogAnalysis({
    super.key,
  });

  @override
  State<LogAnalysis> createState() => _LogAnalysisState();
}

class _LogAnalysisState extends State<LogAnalysis>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  LogFetcher logFetcher = LogFetcher();
  late List<File> eventLogList;

  @override
  void initState() {
    super.initState();
    print("Log Analysis");
    eventLogList = logFetcher.getEventLogList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      children: [
        Flexible(
          flex: 7,
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black54,
                            ),
                          ),
                          child: FileView(
                            files: eventLogList,
                          )),
                    ),
                    const Flexible(
                      flex: 7,
                      child: Center(child: Text("Graph Placeholder")),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                  ),
                  child: const Center(
                    child: Text("log timeline placeholder"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
            ),
            child: const Center(
              child: Text("Detail Placeholder"),
            ),
          ),
        ),
      ],
    );
  }
}
