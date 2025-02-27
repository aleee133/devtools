// Copyright 2023 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import 'cpu_profiler_controller.dart';

class CpuProfilerDisabled extends StatelessWidget {
  const CpuProfilerDisabled(this.controller);

  final CpuProfilerController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('CPU profiler is disabled.'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: controller.enableCpuProfiler,
              child: const Text('Enable profiler'),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyAppStartUpProfile extends StatelessWidget {
  const EmptyAppStartUpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There are no app start up samples available.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: denseSpacing),
          Text(
            'To avoid this, try to open the DevTools CPU profiler '
            'sooner after starting your app.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class EmptyProfileView extends StatelessWidget {
  const EmptyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No CPU samples recorded.'),
    );
  }
}

class ProfileRecordingInstructions extends StatelessWidget {
  const ProfileRecordingInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    const stopRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Click the stop button '),
        Icon(Icons.stop),
        Text(' to end the recording.'),
      ],
    );
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click the record button '),
              Icon(Icons.fiber_manual_record),
              Text(' to start recording CPU samples.'),
            ],
          ),
          stopRow,
        ],
      ),
    );
  }
}

class ProfilerBusyStatus extends _Status {
  ProfilerBusyStatus({required CpuProfilerBusyStatus status})
      : assert(status != CpuProfilerBusyStatus.none),
        super(statusVerb: status.display);
}

class RecordingStatus extends _Status {
  const RecordingStatus() : super(statusVerb: 'Recording');
}

class _Status extends StatelessWidget {
  const _Status({required this.statusVerb});

  final String statusVerb;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$statusVerb CPU samples',
            style: Theme.of(context).subtleTextStyle,
          ),
          const SizedBox(height: defaultSpacing),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
