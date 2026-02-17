/// ═══════════════════════════════════════════════════════════════════════════
/// 🔌 CONVEX CLIENT PROVIDER — DEPRECATED (Offline Mode)
/// ═══════════════════════════════════════════════════════════════════════════
/// This file is kept for backwards compatibility but no longer connects
/// to any backend. All data is served from local fallbacks.
library;

/// Helper to check if Convex is configured (always false now — offline mode)
bool get isConvexConfigured => false;
