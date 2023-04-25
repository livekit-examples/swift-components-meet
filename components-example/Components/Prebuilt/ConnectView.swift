/*
 * Copyright 2023 LiveKit
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI
import LiveKit

struct ConnectView: View {

    @EnvironmentObject var room: Room

    @AppStorage("url") var url: String = ""
    @AppStorage("token") var token: String = ""

    var body: some View {
        VStack {
            TextField("URL", text: $url)
            TextField("Token", text: $token)
            Button("Connect") {
                Task {
                    room.connect(url: url, token: token)
                }
            }
            .disabled(!room.connectionState.isDisconnected)
        }
    }
}
