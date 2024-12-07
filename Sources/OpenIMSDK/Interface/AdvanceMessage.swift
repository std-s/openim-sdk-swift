
import Foundation
import SwiftProtobuf

public struct AdvanceMessage {
    public func addListener(listener: OnMessageListener) {
        ListenerManager.shared.addListener(listener)
    }
    
    public func removeListener(listener: OnMessageListener) {
        ListenerManager.shared.removeListener(listener)
    }
    
    /// Send a message
    public func sendMessage(_ req: SendMessageReq,
                            onProgress: OnProgressListener? = nil) async throws -> IMMessage {
        let result = try await AsyncTaskManager.shared.add {
            let handleID = Utils.callFunc(funcName: .sendMessage,
                                          dataBuffer: try req.serializedData())
            
            if let onProgress {
                ListenerManager.shared.setProgressListener(handleID: handleID,
                                                           listener: onProgress)
            }
            
            return handleID
        } as SendMessageResp
        
        return result.message
    }

    /// Get the message list
    public func findMessageList(_ req: FindMessageListReq) async throws -> [SearchByConversationResult] {
        let result = try await Utils.callCoreAPI(funcName: .findMessageList, req: req) as FindMessageListResp
        
        return result.findResultItems
    }

    /// Get the advanced history message list
    public func getAdvancedHistoryMessageList(_ req: GetAdvancedHistoryMessageListReq) async throws -> GetAdvancedHistoryMessageListCallback {
        let task = Task.detached {
            let result = try await Utils.callCoreAPI(funcName: .getAdvancedHistoryMessageList, req: req) as GetAdvancedHistoryMessageListResp
            
            return result.getAdvancedHistoryMessageListCallback
        }
        
        return try await task.value
    }

    /// Get the advanced history message list in reverse order
    public func getAdvancedHistoryMessageListReverse(_ req: GetAdvancedHistoryMessageListReverseReq) async throws -> GetAdvancedHistoryMessageListCallback {
        let result = try await Utils.callCoreAPI(funcName: .getAdvancedHistoryMessageListReverse, req: req) as GetAdvancedHistoryMessageListReverseResp
        
        return result.getAdvancedHistoryMessageListCallback
    }

    /// Revoke a message
    public func revokeMessage(_ req: RevokeMessageReq) async throws {
        try await Utils.callCoreAPI(funcName: .revokeMessage, req: req) as RevokeMessageResp
    }

    /// Update typing status
    public func typingStatusUpdate(_ req: TypingStatusUpdateReq) async throws {
        try await Utils.callCoreAPI(funcName: .typingStatusUpdate, req: req) as TypingStatusUpdateResp
    }

    /// Mark a conversation message as read
    public func markConversationMessageAsRead(_ req: MarkConversationMessageAsReadReq) async throws {
        try await Utils.callCoreAPI(funcName: .markConversationMessageAsRead, req: req) as MarkConversationMessageAsReadResp
    }

    /// Mark all conversation messages as read
    public func markAllConversationMessageAsRead(_ req: MarkAllConversationMessageAsReadReq) async throws {
        try await Utils.callCoreAPI(funcName: .markAllConversationMessageAsRead, req: req) as MarkAllConversationMessageAsReadResp
    }

    /// Delete a message from local storage
    public func deleteMessageFromLocalStorage(_ req: DeleteMessageFromLocalStorageReq) async throws {
        try await Utils.callCoreAPI(funcName: .deleteMessageFromLocalStorage, req: req) as DeleteMessageFromLocalStorageResp
    }

    /// Delete a message
    public func deleteMessage(_ req: DeleteMessageReq) async throws {
        try await Utils.callCoreAPI(funcName: .deleteMessage, req: req) as DeleteMessageResp
    }

    /// Delete all messages from local storage and server
    public func deleteAllMsgFromLocalAndServer() async throws {
        let req = DeleteAllMsgFromLocalAndServerReq()
        
        try await Utils.callCoreAPI(funcName: .deleteAllMsgFromLocalAndServer, req: req) as DeleteAllMessageFromLocalStorageResp
    }

    /// Delete all messages from local storage
    public func deleteAllMessageFromLocalStorage() async throws {
        let req = DeleteAllMessageFromLocalStorageReq()
        
        try await Utils.callCoreAPI(funcName: .deleteAllMessageFromLocalStorage, req: req) as DeleteAllMessageFromLocalStorageResp
    }

    /// Clear conversation and delete all messages
    public func clearConversationAndDeleteAllMsg(_ req: ClearConversationAndDeleteAllMsgReq) async throws {
        try await Utils.callCoreAPI(funcName: .clearConversationAndDeleteAllMsg, req: req) as ClearConversationAndDeleteAllMsgResp
    }

    /// Delete conversation and delete all messages
    public func deleteConversationAndDeleteAllMsg(_ req: DeleteConversationAndDeleteAllMsgReq) async throws {
        try await Utils.callCoreAPI(funcName: .deleteConversationAndDeleteAllMsg, req: req) as DeleteConversationAndDeleteAllMsgResp
    }

    /// Insert a single message to local storage
    public func insertSingleMessageToLocalStorage(_ req: InsertSingleMessageToLocalStorageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .insertSingleMessageToLocalStorage, req: req) as InsertSingleMessageToLocalStorageResp
        
        return result.msg
    }

    /// Insert a group message to local storage
    public func insertGroupMessageToLocalStorage(_ req: InsertGroupMessageToLocalStorageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .insertGroupMessageToLocalStorage, req: req) as InsertGroupMessageToLocalStorageResp
        
        return result.msg
    }

    /// Search local messages
    public func searchLocalMessages(_ req: SearchLocalMessagesReq) async throws -> SearchLocalMessagesCallback {
        let result = try await Utils.callCoreAPI(funcName: .searchLocalMessages, req: req) as SearchLocalMessagesResp
        
        return result.searchResult
    }

    /// Set message local extensions
    public func setMessageLocalEx(_ req: SetMessageLocalExReq) async throws -> Bool {
        let result = try await Utils.callCoreAPI(funcName: .setMessageLocalEx, req: req) as SetMessageLocalExResp
        
        return result.success
    }

    /// Create a text message
    public func createTextMessage(_ req: CreateTextMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createTextMessage, req: req) as CreateTextMessageResp
        
        return result.message
    }

    /// Create an advanced text message
    public func createAdvancedTextMessage(_ req: CreateAdvancedTextMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createAdvancedTextMessage, req: req) as CreateAdvancedTextMessageResp
        
        return result.message
    }

    /// Create a text at message
    public func createTextAtMessage(_ req: CreateTextAtMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createTextAtMessage, req: req) as CreateTextAtMessageResp
        
        return result.message
    }

    /// Create a location message
    public func createLocationMessage(_ req: CreateLocationMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createLocationMessage, req: req) as CreateLocationMessageResp
        
        return result.message
    }

    /// Create a custom message
    public func createCustomMessage(_ req: CreateCustomMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createCustomMessage, req: req) as CreateCustomMessageResp
        
        return result.message
    }

    /// Create a quote message
    public func createQuoteMessage(_ req: CreateQuoteMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createQuoteMessage, req: req) as CreateQuoteMessageResp
        
        return result.message
    }

    /// Create an advanced quote message
    public func createAdvancedQuoteMessage(_ req: CreateAdvancedQuoteMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createAdvancedQuoteMessage, req: req) as CreateAdvancedQuoteMessageResp
        
        return result.message
    }

    /// Create a card message
    public func createCardMessage(_ req: CreateCardMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createCardMessage, req: req) as CreateCardMessageResp
        
        return result.message
    }

    /// Create an image message
    public func createImageMessage(_ req: CreateImageMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createImageMessage, req: req) as CreateImageMessageResp
        
        return result.message
    }

    /// Create a sound message
    public func createSoundMessage(_ req: CreateSoundMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createSoundMessage, req: req) as CreateSoundMessageResp
        
        return result.message
    }

    /// Create a video message
    public func createVideoMessage(_ req: CreateVideoMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createVideoMessage, req: req) as CreateVideoMessageResp
        
        return result.message
    }

    /// Create a file message
    public func createFileMessage(_ req: CreateFileMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createFileMessage, req: req) as CreateFileMessageResp
        
        return result.message
    }

    /// Create a merger message
    public func createMergerMessage(_ req: CreateMergerMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createMergerMessage, req: req) as CreateMergerMessageResp
        
        return result.message
    }

    /// Create a face message
    public func createFaceMessage(_ req: CreateFaceMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createFaceMessage, req: req) as CreateFaceMessageResp
        
        return result.message
    }

    /// Create a forward message
    public func createForwardMessage(_ req: CreateForwardMessageReq) async throws -> IMMessage {
        let result = try await Utils.callCoreAPI(funcName: .createForwardMessage, req: req) as CreateForwardMessageResp
        
        return result.message
    }
}

extension IMMessage {
    /// Create a message
    /// - Parameter req: CreateTextMessageReq / CreateAdvancedTextMessageReq and so on
    /// example:
    /// do {
    ///     let req = CreateTextMessageReq()
    ///     let msg = try IMMessage.create(req: req)
    /// } catch {
    ///     print(error)
    /// }
    public static func create<T: SwiftProtobuf.Message>(req: T) async throws -> IMMessage? {
        
        var message: IMMessage? = nil
        
        if T.self is CreateTextMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createTextMessage, req: req) as CreateTextMessageResp).message
        } else if T.self is CreateAdvancedTextMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createAdvancedTextMessage, req: req) as CreateAdvancedTextMessageResp).message
        } else if T.self is CreateTextAtMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createTextAtMessage, req: req) as CreateTextAtMessageResp).message
        } else if T.self is CreateLocationMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createLocationMessage, req: req) as CreateLocationMessageResp).message
        } else if T.self is CreateCustomMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createCustomMessage, req: req) as CreateCustomMessageResp).message
        } else if T.self is CreateQuoteMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createQuoteMessage, req: req) as CreateQuoteMessageResp).message
        } else if T.self is CreateAdvancedQuoteMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createAdvancedQuoteMessage, req: req) as CreateAdvancedQuoteMessageResp).message
        } else if T.self is CreateCardMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createCardMessage, req: req) as CreateCardMessageResp).message
        } else if T.self is CreateImageMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createImageMessage, req: req) as CreateImageMessageResp).message
        } else if T.self is CreateSoundMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createSoundMessage, req: req) as CreateSoundMessageResp).message
        } else if T.self is CreateVideoMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createVideoMessage, req: req) as CreateVideoMessageResp).message
        } else if T.self is CreateFileMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createFileMessage, req: req) as CreateFileMessageResp).message
        } else if T.self is CreateMergerMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createMergerMessage, req: req) as CreateMergerMessageResp).message
        } else if T.self is CreateFaceMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createFaceMessage, req: req) as CreateFaceMessageResp).message
        } else if T.self is CreateForwardMessageReq {
            message = (try await Utils.callCoreAPI(funcName: .createForwardMessage, req: req) as CreateForwardMessageResp).message
        }
        
        return message
    }
}

