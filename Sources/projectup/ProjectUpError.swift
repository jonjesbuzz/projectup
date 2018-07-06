public enum ProjectUpError : Error {
    case urlError(failingURL: String)
    case fileWriteError(reason: String, underlyingError: Error)
}