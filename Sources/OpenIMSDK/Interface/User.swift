import Foundation

public struct User: Interface {
    public func addListener(listener: OnUserListener) {
        ListenerManager.shared.addListener(listener)
    }
    
    public func removeListener(listener: OnUserListener) {
        ListenerManager.shared.removeListener(listener)
    }
    
    /// Get all user commands
    public func processUserCommandGetAll() async throws -> [CommandInfo] {
        let req = ProcessUserCommandGetAllReq()
        let result: ProcessUserCommandGetAllResp = try await Utils.callCoreAPI(funcName: .processUserCommandGetAll, req: req)
        
        return result.commands
    }

    /// Get self user information
    public func getSelfUserInfo() async throws -> IMUser {
        let req = GetSelfUserInfoReq()
        let result: GetSelfUserInfoResp = try await Utils.callCoreAPI(funcName: .getSelfUserInfo, req: req)
        
        return result.user
    }

    /// Set self information
    public func setSelfInfo(_ req: SetSelfInfoReq) async throws {
        try await Utils.callCoreAPI(funcName: .setSelfInfo, req: req) as SetSelfInfoResp
    }

    /// Process add user command
    public func processUserCommandAdd(_ req: ProcessUserCommandAddReq) async throws {
        try await Utils.callCoreAPI(funcName: .processUserCommandAdd, req: req) as ProcessUserCommandAddResp
    }

    /// Process delete user command
    public func processUserCommandDelete(_ req: ProcessUserCommandDeleteReq) async throws {
        try await Utils.callCoreAPI(funcName: .processUserCommandDelete, req: req) as ProcessUserCommandDeleteResp
    }

    /// Process update user command
    public func processUserCommandUpdate(_ req: ProcessUserCommandUpdateReq) async throws {
        try await Utils.callCoreAPI(funcName: .processUserCommandUpdate, req: req) as ProcessUserCommandUpdateResp
    }

    /// Get users' information
    public func getUsersInfo(_ req: GetUsersInfoReq) async throws -> [IMUser] {
        let result: GetUsersInfoResp = try await Utils.callCoreAPI(funcName: .getUsersInfo, req: req)
        
        return result.users
    }

    /// Subscribe to users' online status
    public func subscribeUsersOnlineStatus(_ req: SubscribeUsersOnlineStatusReq) async throws -> [UserOnlinePlatform] {
        let result: SubscribeUsersOnlineStatusResp = try await Utils.callCoreAPI(funcName: .subscribeUsersOnlineStatus, req: req)
        
        return result.status
    }

    /// Unsubscribe from users' online status
    public func unsubscribeUsersOnlineStatus(_ req: UnsubscribeUsersOnlineStatusReq) async throws {
        try await Utils.callCoreAPI(funcName: .unsubscribeUsersOnlineStatus, req: req) as UnsubscribeUsersOnlineStatusResp
    }
}

