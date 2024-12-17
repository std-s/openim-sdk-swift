
import Foundation
import SwiftProtobuf

public struct Connection {
    public func addListener(_ listener: OnConnectListener) {
        ListenerManager.shared.addListener(listener)
    }
    
    public func removeListener(_ listener: OnConnectListener) {
        ListenerManager.shared.removeListener(listener)
    }
    
    /// Initialize SDK
    public func initSdk(_ req: IMConfig) async throws -> Bool {
        let task = Task {
            var config = req
            config.platform = req.platform == .platform_ ? .iOs : req.platform
            config.appFramework = req.appFramework == .appFramework_ ? .native : req.appFramework
            config.logFilePath = req.logFilePath.isEmpty ? NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" : req.logFilePath
            
            var initSDKReq = InitSDKReq()
            initSDKReq.config = req
            
            let result: InitSDKResp = try await Utils.callCoreAPI(funcName: .initSdk, req: initSDKReq)
            
            return result.suc
        }
        
        return try await task.value
    }

    /// User login
    public func login(_ req: LoginReq) async throws {
        try await Utils.callCoreAPI(funcName: .login, req: req) as LoginResp
    }

    /// User logout
    public func logout() async throws {
        let req = LogoutReq()
        try await Utils.callCoreAPI(funcName: .logout, req: req) as LogoutResp
    }

    /// Set app background status
    public func setAppBackgroundStatus() async throws {
        let req = SetAppBackgroundStatusReq()
        try await Utils.callCoreAPI(funcName: .setAppBackgroundStatus, req: req) as SetAppBackgroundStatusResp
    }

    /// Network status changed
    public func networkStatusChanged() async throws {
        let req = NetworkStatusChangedReq()
        try await Utils.callCoreAPI(funcName: .networkStatusChanged, req: req) as NetworkStatusChangedResp
    }

    /// Get login status
    public func getLoginStatus() async throws -> LoginStatus {
        let req = GetLoginStatusReq()
        let result: GetLoginStatusResp = try await Utils.callCoreAPI(funcName: .getLoginStatus, req: req)
        
        return result.status
    }

    /// Get SDK version
    public func version() async throws -> String {
        let req = VersionReq()
        let result: VersionResp = try await Utils.callCoreAPI(funcName: .version, req: req)
        
        return result.version
    }

    /// Upload logs
    public func uploadLogs(_ req: UploadSDKDataReq,
                           onProgress: OnProgressListener? = nil) async throws {
        try await AsyncTaskManager.shared.add {
            let handleID = Utils.callFunc(funcName: .uploadLogs,
                                          dataBuffer: try req.serializedData())
            
            if let onProgress {
                ListenerManager.shared.setProgressListener(handleID: handleID,
                                                           listener: onProgress)
            }
            
            return handleID
        } as UploadSDKDataResp
    }

    /// Upload file
    public func uploadFile(_ req: UploadFileReq, 
                           onProgress: OnProgressListener? = nil) async throws -> String {
        let result = try await AsyncTaskManager.shared.add {
            let handleID = Utils.callFunc(funcName: .uploadFile,
                                          dataBuffer: try req.serializedData())
            
            if let onProgress {
                ListenerManager.shared.setProgressListener(handleID: handleID,
                                                           listener: onProgress)
            }
            
            return handleID
        } as UploadFileResp
        
        return result.url
    }

    /// Log message
    public func log(_ req: LogReq) async throws {
        try await Utils.callCoreAPI(funcName: .log, req: req) as LogResp
    }

    /// Update FCM token
    public func updateFcmToken(_ req: UpdateFcmTokenReq) async throws {
        try await Utils.callCoreAPI(funcName: .updateFcmToken, req: req) as UpdateFcmTokenResp
    }

    /// Set app badge
    public func setAppBadge(_ req: SetAppBadgeReq) async throws {
        try await Utils.callCoreAPI(funcName: .setAppBadge, req: req) as SetAppBadgeResp
    }
}
