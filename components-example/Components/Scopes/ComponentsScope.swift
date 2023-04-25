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

struct ComponentsScope<Content: View>: View {

    var content: () -> Content
    let configuration: UIConfiguration

    init(configuration: UIConfiguration? = nil, @ViewBuilder _ content: @escaping () -> Content) {
        self.configuration = configuration ?? UIConfiguration()
        self.content = content
    }

    var body: some View {
        content()
            .environmentObject(configuration)
    }
}
