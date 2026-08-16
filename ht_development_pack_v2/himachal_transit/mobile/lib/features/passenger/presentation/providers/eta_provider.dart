import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himachal_transit_mobile/services/api_repository.dart';
import 'package:himachal_transit_mobile/models/eta.dart';

// ETA State
class EtaState {
  final EtaResult? etaResult;
  final String? error;
  final DateTime? lastUpdated;
  
  const EtaState({
    this.etaResult,
    this.error,
    this.lastUpdated,
  });
  
  EtaState copyWith({
    EtaResult? etaResult,
    String? error,
    DateTime? lastUpdated,
  }) {
    return EtaState(
      etaResult: etaResult ?? this.etaResult,
      error: error ?? this.error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

// ETA Notifier - fetches ETA periodically
class EtaNotifier extends StateNotifier<EtaState> {
  final ApiRepository _apiRepository;
  final String _tripId;
  Timer? _timer;
  
  EtaNotifier(this._apiRepository, this._tripId) : super(const EtaState()) {
    _startPolling();
  }
  
  void _startPolling() {
    // Fetch immediately
    _fetchEta();
    
    // Then poll every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      _fetchEta();
    });
  }
  
  Future<void> _fetchEta() async {
    try {
      final eta = await _apiRepository.getTripEta(_tripId);
      state = state.copyWith(
        etaResult: eta,
        error: null,
        lastUpdated: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
      );
    }
  }
  
  void updateTripId(String newTripId) {
    // Not implemented for simplicity - would cancel timer and restart
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// Provider for ETA - takes tripId as parameter
final etaProvider = StateNotifierProvider.family<EtaNotifier, EtaState, String>((ref, tripId) {
  final apiRepository = ref.watch(apiRepositoryProvider);
  return EtaNotifier(apiRepository, tripId);
});