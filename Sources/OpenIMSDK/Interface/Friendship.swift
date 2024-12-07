import Foundation

public struct Friendship {
    public func addListener(listener: OnFriendshipListener) {
        ListenerManager.shared.addListener(listener)
    }
    
    public func removeListener(listener: OnFriendshipListener) {
        ListenerManager.shared.removeListener(listener)
    }
    
    /// Get specified friends
    public func getSpecifiedFriends(_ req: GetSpecifiedFriendsReq) async throws -> [IMFriend] {
        let result = try await Utils.callCoreAPI(funcName: .getSpecifiedFriends, req: req) as GetSpecifiedFriendsResp
        
        return result.friends
    }

    /// Add a friend
    public func addFriend(_ req: AddFriendReq) async throws {
        try await Utils.callCoreAPI(funcName: .addFriend, req: req) as AddFriendResp
    }

    /// Get friend requests
    public func getFriendRequests(_ req: GetFriendRequestsReq) async throws -> [IMFriendApplication] {
        let result = try await Utils.callCoreAPI(funcName: .getFriendRequests, req: req) as GetFriendRequestsResp
        
        return result.requests
    }

    /// Handle friend request
    public func handlerFriendRequest(_ req: HandleFriendRequestReq) async throws {
        try await Utils.callCoreAPI(funcName: .handlerFriendRequest, req: req) as HandleFriendRequestResp
    }

    /// Check friendship status
    public func checkFriend(_ req: CheckFriendReq) async throws -> [CheckFriendInfo] {
        let result = try await Utils.callCoreAPI(funcName: .checkFriend, req: req) as CheckFriendResp
        
        return result.result
    }

    /// Delete a friend
    public func deleteFriend(_ req: DeleteFriendReq) async throws {
        try await Utils.callCoreAPI(funcName: .deleteFriend, req: req) as DeleteFriendResp
    }

    /// Get list of friends
    public func getFriends(_ req: GetFriendsReq) async throws -> [IMFriend] {
        let result = try await Utils.callCoreAPI(funcName: .getFriends, req: req) as GetFriendsResp
        
        return result.friends
    }

    /// Get friends with pagination
    public func getFriendsPage(_ req: GetFriendsPageReq) async throws -> [IMFriend] {
        let result = try await Utils.callCoreAPI(funcName: .getFriendsPage, req: req) as GetFriendsPageResp
        
        return result.friends
    }

    /// Search for friends
    public func searchFriends(_ req: SearchFriendsReq) async throws -> [SearchFriendsInfo] {
        let result = try await Utils.callCoreAPI(funcName: .searchFriends, req: req) as SearchFriendsResp
        
        return result.friends
    }

    /// Add to blacklist
    public func addBlack(_ req: AddBlackReq) async throws {
        try await Utils.callCoreAPI(funcName: .addBlack, req: req) as AddBlackResp
    }

    /// Remove from blacklist
    public func deleteBlack(_ req: DeleteBlackReq) async throws {
        try await Utils.callCoreAPI(funcName: .deleteBlack, req: req) as DeleteBlackResp
    }

    /// Get blacklist
    public func getBlacks(_ req: GetBlacksReq) async throws -> [IMBlack] {
        let result = try await Utils.callCoreAPI(funcName: .getBlacks, req: req) as GetBlacksResp
        
        return result.blacks
    }

    /// Update friend information
    public func updateFriends(_ req: UpdatesFriendsReq) async throws {
        try await Utils.callCoreAPI(funcName: .updateFriends, req: req) as UpdatesFriendsResp
    }
}
