import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:watch_check/ui/widgets/buttons/reset.dart';
import 'package:watch_check/ui/widgets/buttons/start_stop.dart';
import 'package:watch_check/ui/widgets/stopwatch_renderer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: Center(
        child: StopWatch(),
      )),
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration _previousTimeElapsed = Duration.zero;
  Duration _currentTimeElapsed = Duration.zero;
  bool _isRunning = false;
  Duration get _elapsed => _previousTimeElapsed + _currentTimeElapsed;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentTimeElapsed = elapsed;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleTime() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previousTimeElapsed += _currentTimeElapsed;
        _currentTimeElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previousTimeElapsed = Duration.zero;
      _currentTimeElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopWatchRenderer(elapsed: _elapsed, radius: radius),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: ResetButton(
                  onPressed: _reset,
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: StartStopButton(
                isRunning: _isRunning,
                onPressed: _toggleTime,
              ),
            ),
          )
        ],
      );
    });
  }
}
