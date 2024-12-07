import Foundation

/// Represents an SDK error with a code and an optional message.
public struct IMSDKError: Error {
    public let code: ErrorCode // The error code associated with the SDK error.
    public let message: String?   // An optional error message providing additional context.

    /// Initializes an IMSDKError with the given code and message.
    /// - Parameters:
    ///   - code: The error code representing the type of error.
    ///   - message: An optional message providing details about the error.
    init(code: ErrorCode, message: String?) {
        self.code = code
        self.message = message
    }
}
