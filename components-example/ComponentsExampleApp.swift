import SwiftUI
import LiveKitComponents

@main
struct ComponentsExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ComponentsScope() {
                RoomScope {
                    VideoConferenceView()
                }
            }
        }
    }
}
