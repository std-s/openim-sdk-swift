import Foundation

public struct Conversation: Interface {
    public func addListener(_ listener: OnConversationListener) {
        ListenerManager.shared.addListener(listener)
    }
    
    public func removeListener(_ listener: OnConnectListener) {
        ListenerManager.shared.removeListener(listener)
    }
    
    /// Get all conversation list
    public func getAllConversationList(_ req: GetAllConversationListReq) async throws -> [IMConversation] {
        let result = try await Utils.callCoreAPI(funcName: .getAllConversationList, req: req) as GetAllConversationListResp
        
        return result.conversationList
    }

    /// Get conversation list with split
    public func getConversationListSplit(_ req: GetConversationListSplitReq) async throws -> [IMConversation] {
        let result = try await Utils.callCoreAPI(funcName: .getConversationListSplit, req: req) as GetConversationListSplitResp
        
        return result.conversationList
    }

    /// Hide conversation
    public func hideConversation(_ req: HideConversationReq) async throws {
        _ = try await Utils.callCoreAPI(funcName: .hideConversation, req: req) as HideConversationResp
    }

    /// Get "at all" tag
    public func getAtAllTag(_ req: GetAtAllTagReq) async throws -> String {
        let result = try await Utils.callCoreAPI(funcName: .getAtAllTag, req: req) as GetAtAllTagResp
        
        return result.tag
    }

    /// Get one conversation
    public func getOneConversation(_ req: GetOneConversationReq) async throws -> IMConversation {
        let result = try await Utils.callCoreAPI(funcName: .getOneConversation, req: req) as GetOneConversationResp
        
        return result.conversation
    }

    /// Get multiple conversations
    public func getMultipleConversation(_ req: GetMultipleConversationReq) async throws -> [IMConversation] {
        let result = try await Utils.callCoreAPI(funcName: .getMultipleConversation, req: req) as GetMultipleConversationResp
        
        return result.conversationList
    }

    /// Hide all conversations
    public func hideAllConversations(_ req: HideAllConversationsReq) async throws {
        _ = try await Utils.callCoreAPI(funcName: .hideAllConversations, req: req) as HideAllConversationsResp
    }

    /// Set conversation draft
    public func setConversationDraft(_ req: SetConversationDraftReq) async throws {
        _ = try await Utils.callCoreAPI(funcName: .setConversationDraft, req: req) as SetConversationDraftResp
    }

    /// Set conversation settings
    public func setConversation(_ req: SetConversationReq) async throws {
        _ = try await Utils.callCoreAPI(funcName: .setConversation, req: req) as SetConversationResp
    }

    /// Get total unread message count
    public func getTotalUnreadMsgCount(_ req: GetTotalUnreadMsgCountReq) async throws -> Int {
        let result = try await Utils.callCoreAPI(funcName: .getTotalUnreadMsgCount, req: req) as GetTotalUnreadMsgCountResp
        
        return Int(result.totalUnreadCount)
    }

    /// Get conversation ID by session type
    public func getConversationIdbySessionType(_ req: GetConversationIDBySessionTypeReq) async throws -> String {
        let result = try await Utils.callCoreAPI(funcName: .getConversationIdbySessionType, req: req) as GetConversationIDBySessionTypeResp
        
        return result.conversationID
    }
}
