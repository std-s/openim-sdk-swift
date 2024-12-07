import Foundation

class AsyncTaskManager {
    static let shared = AsyncTaskManager()

    private let queue = DispatchQueue(label: "com.AsyncTaskManager.mapQueue", attributes: .concurrent)
    private var map: [UInt64: Any] = [:] // Store continuations by handleID.

    private init() {}

    func add<T>(_ execute: @escaping () throws -> UInt64) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            do {
                let handleID = try execute()
                queue.async(flags: .barrier) {
                    self.map[handleID] = continuation
                }
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }

    func get<T>(handleID: UInt64) -> CheckedContinuation<T, Error>? {
        queue.sync {
            return map[handleID] as? CheckedContinuation<T, Error>
        }
    }

    func resume<T>(handleID: UInt64, with result: Result<T, Error>) {        
        guard let continuation: CheckedContinuation<T, Error> = get(handleID: handleID) else {
            remove(handleID: handleID)
            
            return
        }

        switch result {
        case .success(let value):
            continuation.resume(returning: value)
        case .failure(let error):
            continuation.resume(throwing: error)
        }

        remove(handleID: handleID)
    }

    private func remove(handleID: UInt64) {
        queue.async(flags: .barrier) {
            self.map.removeValue(forKey: handleID)
        }
    }
}

