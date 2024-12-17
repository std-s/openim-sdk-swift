import Foundation

public struct Group: Interface {
    public func addListener(_ listener: OnGroupListener) {
        ListenerManager.shared.addListener(listener)
    }
    
    public func removeListener(_ listener: OnGroupListener) {
        ListenerManager.shared.removeListener(listener)
    }
    
    /// Create a group
    public func createGroup(_ req: CreateGroupReq) async throws -> IMGroup {
        let result = try await Utils.callCoreAPI(funcName: .createGroup, req: req) as CreateGroupResp
        
        return result.groupInfo
    }
    
    /// Join a group
    public func joinGroup(_ req: JoinGroupReq) async throws {
        try await Utils.callCoreAPI(funcName: .joinGroup, req: req) as JoinGroupResp
    }
    
    /// Quit a group
    public func quitGroup(_ req: QuitGroupReq) async throws {
        try await Utils.callCoreAPI(funcName: .quitGroup, req: req) as QuitGroupResp
    }
    
    /// Dismiss a group
    public func dismissGroup(_ req: DismissGroupReq) async throws {
        try await Utils.callCoreAPI(funcName: .dismissGroup, req: req) as DismissGroupResp
    }
    
    /// Change group mute settings
    public func changeGroupMute(_ req: ChangeGroupMuteReq) async throws {
        try await Utils.callCoreAPI(funcName: .changeGroupMute, req: req) as ChangeGroupMuteResp
    }
    
    /// Change group member mute settings
    public func changeGroupMemberMute(_ req: ChangeGroupMemberMuteReq) async throws {
        try await Utils.callCoreAPI(funcName: .changeGroupMemberMute, req: req) as ChangeGroupMemberMuteResp
    }
    
    /// Transfer group ownership
    public func transferGroupOwner(_ req: TransferGroupOwnerReq) async throws {
        try await Utils.callCoreAPI(funcName: .transferGroupOwner, req: req) as TransferGroupOwnerResp
    }
    
    /// Kick a group member
    public func kickGroupMember(_ req: KickGroupMemberReq) async throws {
        try await Utils.callCoreAPI(funcName: .kickGroupMember, req: req) as KickGroupMemberResp
    }
    
    /// Set group information
    public func setGroupInfo(_ req: SetGroupInfoReq) async throws {
        try await Utils.callCoreAPI(funcName: .setGroupInfo, req: req) as SetGroupInfoResp
    }
    
    /// Set group member information
    public func setGroupMemberInfo(_ req: SetGroupMemberInfoReq) async throws {
        try await Utils.callCoreAPI(funcName: .setGroupMemberInfo, req: req) as SetGroupMemberInfoResp
    }
    
    /// Get joined groups
    public func getJoinedGroups(_ req: GetJoinedGroupsReq) async throws -> [IMGroup] {
        let result = try await Utils.callCoreAPI(funcName: .getJoinedGroups, req: req) as GetJoinedGroupsResp
        
        return result.groups
    }
    
    /// Get joined groups with pagination
    public func getJoinedGroupsPage(_ req: GetJoinedGroupsPageReq) async throws -> [IMGroup] {
        let result = try await Utils.callCoreAPI(funcName: .getJoinedGroupsPage, req: req) as GetJoinedGroupsResp
        
        return result.groups
    }
    
    /// Get specified group information
    public func getSpecifiedGroupsInfo(_ req: GetSpecifiedGroupsInfoReq) async throws -> [IMGroup] {
        let result = try await Utils.callCoreAPI(funcName: .getSpecifiedGroupsInfo, req: req) as GetSpecifiedGroupsInfoResp
        
        return result.groups
    }
    
    /// Search groups
    public func searchGroups(_ req: SearchGroupsReq) async throws -> [IMGroup] {
        let result = try await Utils.callCoreAPI(funcName: .searchGroups, req: req) as SearchGroupsResp
        
        return result.groups
    }
    
    /// Get group member owner and admin information
    public func getGroupMemberOwnerAndAdmin(_ req: GetGroupMemberOwnerAndAdminReq) async throws -> [IMGroupMember] {
        let result = try await Utils.callCoreAPI(funcName: .getGroupMemberOwnerAndAdmin, req: req) as GetGroupMemberOwnerAndAdminResp
        
        return result.members
    }
    
    /// Get group members by join time filter
    public func getGroupMembersByJoinTimeFilter(_ req: GetGroupMembersByJoinTimeFilterReq) async throws -> [IMGroupMember] {
        let result = try await Utils.callCoreAPI(funcName: .getGroupMembersByJoinTimeFilter, req: req) as GetGroupMembersByJoinTimeFilterResp
        
        return result.members
    }
    
    /// Get specified group members information
    public func getSpecifiedGroupMembersInfo(_ req: GetSpecifiedGroupMembersInfoReq) async throws -> [IMGroupMember] {
        let result = try await Utils.callCoreAPI(funcName: .getSpecifiedGroupMembersInfo, req: req) as GetSpecifiedGroupMembersInfoResp
        
        return result.members
    }
    
    /// Get group members
    public func getGroupMembers(_ req: GetGroupMembersReq) async throws -> [IMGroupMember] {
        let result = try await Utils.callCoreAPI(funcName: .getGroupMembers, req: req) as GetGroupMembersResp
        
        return result.members
    }
    
    /// Get group request
    public func getGroupApplication(_ req: GetGroupApplicationReq) async throws -> [IMGroupApplication] {
        let result = try await Utils.callCoreAPI(funcName: .getGroupApplication, req: req) as GetGroupApplicationResp
        
        return result.applications
    }
    
    /// Search group members
    public func searchGroupMembers(_ req: SearchGroupMembersReq) async throws -> [IMGroupMember] {
        let result = try await Utils.callCoreAPI(funcName: .searchGroupMembers, req: req) as SearchGroupMembersResp
        
        return result.members
    }
    
    /// Check if user has joined a group
    public func isJoinGroup(_ req: IsJoinGroupReq) async throws -> Bool {
        let result = try await Utils.callCoreAPI(funcName: .isJoinGroup, req: req) as IsJoinGroupResp
        
        return result.joined
    }
    
    /// Get users in a group
    public func getUsersInGroup(_ req: GetUsersInGroupReq) async throws -> [String] {
        let result = try await Utils.callCoreAPI(funcName: .getUsersInGroup, req: req) as GetUsersInGroupResp
        
        return result.userIds
    }
    
    /// Invite user to group
    public func inviteUserToGroup(_ req: InviteUserToGroupReq) async throws {
        try await Utils.callCoreAPI(funcName: .inviteUserToGroup, req: req) as InviteUserToGroupResp
    }
    
    /// Handle group request
    public func handleGroupApplication(_ req: HandleGroupApplicationReq) async throws {
        try await Utils.callCoreAPI(funcName: .handleGroupApplication, req: req) as HandleGroupApplicationResp
    }
}
