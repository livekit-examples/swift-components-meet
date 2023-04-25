//
//  components_exampleApp.swift
//  components-example
//
//  Created by Hiroshi Horie on 2023/04/24.
//

import SwiftUI

class MyCustomUI: UIConfiguration {

}

let myCustomUI = MyCustomUI()

@main
struct ComponentsExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ComponentsScope(configuration: myCustomUI) {
                RoomScope {
                    VideoConferenceView()
                }
            }
        }
    }
}
