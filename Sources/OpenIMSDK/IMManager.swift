import Foundation

public struct IMManager {
    public static let shared = IMManager()

    private init() {
        ResponseManager.shared.setCoreResponse()
    }

    public private(set) var connection = Connection()
    public private(set) var user = User()
    public private(set) var conversation = Conversation()
    public private(set) var message = AdvanceMessage()
    public private(set) var friendship = Friendship()
    public private(set) var group = OpenIMSDK.Group()

    public static var connection: Connection { shared.connection }
    public static var user: User { shared.user }
    public static var conversation: Conversation { shared.conversation }
    public static var message: AdvanceMessage { shared.message }
    public static var friendship: Friendship { shared.friendship }
    public static var group: OpenIMSDK.Group { shared.group }
}

