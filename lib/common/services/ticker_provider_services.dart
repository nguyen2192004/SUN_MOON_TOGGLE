import 'package:flutter/scheduler.dart';

class TickerProviderStub extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
