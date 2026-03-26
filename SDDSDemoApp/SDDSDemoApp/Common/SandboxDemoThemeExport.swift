#if !(SANDBOX_DS_SERV || SANDBOX_DS_PLASMA_B2C || SANDBOX_DS_PLASMA_HOME_DS)
import SandboxDemoTheme
#endif

/// Aggregate demo theme used across view models (disambiguated from ``SDDSServTheme/Theme`` and other DS `Theme` types).
typealias Theme = SandboxDemoAppTheme
