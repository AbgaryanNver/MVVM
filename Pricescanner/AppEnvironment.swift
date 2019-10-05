enum AppEnvironment {
    case develop
    case production

    #if DEVELOPMENT
        static let current: AppEnvironment = .develop
    #else
        static let current: AppEnvironment = .production
    #endif

    var isDebug: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

    var environmentURL: String {
        switch self {
            case .develop:
                return "https://..."
            case .production:
                return "https://..."
        }
    }
}
