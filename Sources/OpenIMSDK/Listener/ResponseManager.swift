import Foundation
import SwiftProtobuf
import OpenIMSDKCore

typealias CallBack = @convention(c) (UnsafeMutableRawPointer?, Int32) -> Void

class ResponseManager {
    static var shared = ResponseManager()
    
    private init() {}
    
    func setCoreResponse() {
        let onResponse: CallBack = { ptr, len in
            ResponseManager.shared.onResponse(dataPtr: ptr, len: len)
        }
        
        OpenIMSDKCore.ffi_init(onResponse, 2)
    }
    
    private let connectionTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .initSdk: InitSDKResp.self,
        .login: LoginResp.self,
        .logout: LogoutResp.self,
        .getLoginStatus: GetLoginStatusResp.self,
        .uploadFile: UploadFileResp.self,
        .updateFcmToken: UpdateFcmTokenResp.self,
        .log: LogResp.self,
        .version: VersionResp.self
    ]
    
    private let userTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .getUsersInfo: GetUsersInfoResp.self,
        .getSelfUserInfo: GetSelfUserInfoResp.self,
        .setSelfInfo: SetSelfInfoResp.self,
        .subscribeUsersOnlineStatus: SubscribeUsersOnlineStatusResp.self,
        .unsubscribeUsersOnlineStatus: UnsubscribeUsersOnlineStatusResp.self
    ]
    
    private let conversationTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .getAllConversationList: GetAllConversationListResp.self,
        .getConversationListSplit: GetConversationListSplitResp.self,
        .hideConversation: HideConversationResp.self,
        .getAtAllTag: GetAtAllTagResp.self,
        .getOneConversation: GetOneConversationResp.self,
        .getMultipleConversation: GetMultipleConversationResp.self,
        .hideAllConversations: HideAllConversationsResp.self,
        .setConversationDraft: SetConversationDraftResp.self,
        .setConversation: SetConversationResp.self,
        .getTotalUnreadMsgCount: GetTotalUnreadMsgCountResp.self,
        .getConversationIdbySessionType: GetConversationIDBySessionTypeResp.self
    ]
    
    private let messageTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .sendMessage: SendMessageResp.self,
        .findMessageList: FindMessageListResp.self,
        .getAdvancedHistoryMessageList: GetAdvancedHistoryMessageListResp.self,
        .getAdvancedHistoryMessageListReverse: GetAdvancedHistoryMessageListReverseResp.self,
        .revokeMessage: RevokeMessageResp.self,
        .typingStatusUpdate: TypingStatusUpdateResp.self,
        .markConversationMessageAsRead: MarkConversationMessageAsReadResp.self,
        .markAllConversationMessageAsRead: MarkAllConversationMessageAsReadResp.self,
        .deleteMessageFromLocalStorage: DeleteMessageFromLocalStorageResp.self,
        .deleteMessage: DeleteMessageResp.self,
        .deleteAllMsgFromLocalAndServer: DeleteAllMsgFromLocalAndServerResp.self,
        .deleteAllMessageFromLocalStorage: DeleteAllMessageFromLocalStorageResp.self,
        .clearConversationAndDeleteAllMsg: ClearConversationAndDeleteAllMsgResp.self,
        .deleteConversationAndDeleteAllMsg: DeleteConversationAndDeleteAllMsgResp.self,
        .insertSingleMessageToLocalStorage: InsertSingleMessageToLocalStorageResp.self,
        .insertGroupMessageToLocalStorage: InsertGroupMessageToLocalStorageResp.self,
        .searchLocalMessages: SearchLocalMessagesResp.self,
        .setMessageLocalEx: SetMessageLocalExResp.self,
        .searchConversation: SearchConversationResp.self,
        .createTextMessage: CreateTextMessageResp.self,
        .createAdvancedTextMessage: CreateAdvancedTextMessageResp.self,
        .createTextAtMessage: CreateTextAtMessageResp.self,
        .createLocationMessage: CreateLocationMessageResp.self,
        .createCustomMessage: CreateCustomMessageResp.self,
        .createQuoteMessage: CreateQuoteMessageResp.self,
        .createAdvancedQuoteMessage: CreateAdvancedQuoteMessageResp.self,
        .createCardMessage: CreateCardMessageResp.self,
        .createImageMessage: CreateImageMessageResp.self,
        .createSoundMessage: CreateSoundMessageResp.self,
        .createVideoMessage: CreateVideoMessageResp.self,
        .createFileMessage: CreateFileMessageResp.self,
        .createMergerMessage: CreateMergerMessageResp.self,
        .createFaceMessage: CreateFaceMessageResp.self,
        .createForwardMessage: CreateForwardMessageResp.self
    ]
    
    private let friendshipTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .getSpecifiedFriends: GetSpecifiedFriendsResp.self,
        .addFriend: AddFriendResp.self,
        .getFriendRequests: GetFriendRequestsResp.self,
        .handlerFriendRequest: HandleFriendRequestResp.self,
        .checkFriend: CheckFriendResp.self,
        .deleteFriend: DeleteFriendResp.self,
        .getFriends: GetFriendsResp.self,
        .getFriendsPage: GetFriendsPageResp.self,
        .searchFriends: SearchFriendsResp.self,
        .addBlack: AddBlackResp.self,
        .deleteBlack: DeleteBlackResp.self,
        .getBlacks: GetBlacksResp.self,
        .updateFriends: UpdatesFriendsResp.self
    ]
    
    private let groupTypeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type] = [
        .createGroup: CreateGroupResp.self,
        .joinGroup: JoinGroupResp.self,
        .quitGroup: QuitGroupResp.self,
        .dismissGroup: DismissGroupResp.self,
        .changeGroupMute: ChangeGroupMuteResp.self,
        .changeGroupMemberMute: ChangeGroupMemberMuteResp.self,
        .transferGroupOwner: TransferGroupOwnerResp.self,
        .kickGroupMember: KickGroupMemberResp.self,
        .setGroupInfo: SetGroupInfoResp.self,
        .setGroupMemberInfo: SetGroupMemberInfoResp.self,
        .getJoinedGroups: GetJoinedGroupsResp.self,
        .getJoinedGroupsPage: GetJoinedGroupsPageResp.self,
        .getSpecifiedGroupsInfo: GetSpecifiedGroupsInfoResp.self,
        .searchGroups: SearchGroupsResp.self,
        .getGroupMemberOwnerAndAdmin: GetGroupMemberOwnerAndAdminResp.self,
        .getGroupMembersByJoinTimeFilter: GetGroupMembersByJoinTimeFilterResp.self,
        .getSpecifiedGroupMembersInfo: GetSpecifiedGroupMembersInfoResp.self,
        .getGroupMembers: GetGroupMembersResp.self,
        .getGroupRequest: GetGroupRequestResp.self,
        .searchGroupMembers: SearchGroupMembersResp.self,
        .isJoinGroup: IsJoinGroupResp.self,
        .getUsersInGroup: GetUsersInGroupResp.self,
        .inviteUserToGroup: InviteUserToGroupResp.self,
        .handlerGroupRequest: HandlerGroupRequestResp.self
    ]
    
    private func onResponse(dataPtr: UnsafeMutableRawPointer?, len: Int32) {
        guard let dataPtr else { return }
        
        let byteBuffer = [UInt8](UnsafeBufferPointer(start: dataPtr.assumingMemoryBound(to: UInt8.self), count: Int(len)))
        let result = try! FfiResult(serializedBytes: byteBuffer)
        
        handleFunctionResponse(result: result)
        
        OpenIMSDKCore.ffi_drop_handle(result.handleID)
    }
    
    private func handleFunctionResponse(result: FfiResult) {
        let handleID = result.handleID
        let funcName = result.funcName
        let data = result.data
        
        switch result.funcName {
        case .initSdk,
                .login,
                .logout,
                .getLoginStatus,
                .uploadFile,
                .updateFcmToken,
                .uploadLogs,
                .version:
            handleFunc(ffiResult: result, typeMap: connectionTypeMap)
            break
        case .getUsersInfo,
                .getSelfUserInfo,
                .setSelfInfo,
                .subscribeUsersOnlineStatus,
                .unsubscribeUsersOnlineStatus:
            handleFunc(ffiResult: result, typeMap: userTypeMap)
            break
        case .getAllConversationList,
                .getConversationListSplit,
                .hideConversation,
                .getAtAllTag,
                .getOneConversation,
                .getMultipleConversation,
                .hideAllConversations,
                .setConversationDraft,
                .setConversation,
                .getTotalUnreadMsgCount,
                .getConversationIdbySessionType:
            handleFunc(ffiResult: result, typeMap: conversationTypeMap)
            break
        case .sendMessage,
                .findMessageList,
                .getAdvancedHistoryMessageList,
                .getAdvancedHistoryMessageListReverse,
                .revokeMessage,
                .typingStatusUpdate,
                .markConversationMessageAsRead,
                .markAllConversationMessageAsRead,
                .deleteMessageFromLocalStorage,
                .deleteMessage,
                .deleteAllMsgFromLocalAndServer,
                .deleteAllMessageFromLocalStorage,
                .clearConversationAndDeleteAllMsg,
                .deleteConversationAndDeleteAllMsg,
                .insertSingleMessageToLocalStorage,
                .insertGroupMessageToLocalStorage,
                .searchLocalMessages,
                .setMessageLocalEx,
                .searchConversation,
                .createTextMessage,
                .createAdvancedTextMessage,
                .createTextAtMessage,
                .createLocationMessage,
                .createCustomMessage,
                .createQuoteMessage,
                .createAdvancedQuoteMessage,
                .createCardMessage,
                .createImageMessage,
                .createSoundMessage,
                .createVideoMessage,
                .createFileMessage,
                .createMergerMessage,
                .createFaceMessage,
                .createForwardMessage:
            handleFunc(ffiResult: result, typeMap: messageTypeMap)
            break
        case .getSpecifiedFriends,
                .addFriend,
                .getFriendRequests,
                .handlerFriendRequest,
                .checkFriend,
                .deleteFriend,
                .getFriends,
                .getFriendsPage,
                .searchFriends,
                .addBlack,
                .deleteBlack,
                .getBlacks,
                .updateFriends:
            handleFunc(ffiResult: result,  typeMap: friendshipTypeMap)
            break
        case .createGroup,
                .joinGroup,
                .quitGroup,
                .dismissGroup,
                .changeGroupMute,
                .changeGroupMemberMute,
                .transferGroupOwner,
                .kickGroupMember,
                .setGroupInfo,
                .setGroupMemberInfo,
                .getJoinedGroups,
                .getJoinedGroupsPage,
                .getSpecifiedGroupsInfo,
                .searchGroups,
                .getGroupMemberOwnerAndAdmin,
                .getGroupMembersByJoinTimeFilter,
                .getSpecifiedGroupMembersInfo,
                .getGroupMembers,
                .getGroupRequest,
                .searchGroupMembers,
                .isJoinGroup,
                .getUsersInGroup,
                .inviteUserToGroup,
                .handlerGroupRequest:
            handleFunc(ffiResult: result, typeMap: groupTypeMap)
            break
        default:
            ListenerManager.shared.handleEvent(result: result)
        }
    }
    
    // A generic handler function for handling both connection and user events
    private func handleFunc(ffiResult: FfiResult, typeMap: [FuncRequestEventName: SwiftProtobuf.Message.Type]) {
        let funcName = ffiResult.funcName

        guard let type = typeMap[funcName] else {
            print("Unhandled funcName: \(funcName)")
            
            return
        }
        
        let handleID = ffiResult.handleID
        let errCode = ffiResult.errCode
        print("\(#function) handle event: \(funcName)[\(handleID)]")

        if errCode > 0 {
            let errMsg = ffiResult.errMsg
            
            handleFailure(type, handleID: handleID, code: errCode, errMsg: errMsg)
        } else {
            let data = ffiResult.data
                    
            handleSuccess(type, handleID: handleID, data: data)
        }
    }
    
    private func handleSuccess<T: SwiftProtobuf.Message>(_ type: T.Type, handleID: UInt64, data: Data) {
        do {
            let result = try T(serializedBytes: data)
            let success: Result<T, Error> = .success(result)
            
            resume(handleID: handleID, result: success)
        } catch {
            print("\(#function) throw an error: \(error)")
        }
    }
    
    private func handleFailure<T: SwiftProtobuf.Message>(_ type: T.Type, handleID: UInt64, code: Int32, errMsg: String) {
        let error = IMSDKError(code: ErrorCode(rawValue: Int(code)) ?? .noError, message: errMsg)
        let failure: Result<T, Error> = .failure(error)
        
        resume(handleID: handleID, result: failure)
    }
    
    private func resume<T>(handleID: UInt64, result: Result<T, Error>) {
        AsyncTaskManager.shared.resume(handleID: handleID, with: result)
    }
}
