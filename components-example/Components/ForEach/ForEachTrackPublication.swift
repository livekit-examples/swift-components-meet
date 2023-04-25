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

struct ForEachTrackPublication<Content: View>: View {

    enum Filter {
        case all
        case video
        case audio
    }

    @EnvironmentObject var participant: Participant

    let filter: Filter
    let content: TrackPublicationComponentBuilder<Content>

    init(filter: Filter = .video, @ViewBuilder content: @escaping TrackPublicationComponentBuilder<Content>) {
        self.filter = filter
        self.content = content
    }

    func computedTrackPublications() -> [TrackPublication] {
        let trackPublications = Array(participant.tracks.values)
        switch filter {
        case .all: return trackPublications
        case .video: return trackPublications.filter { $0.kind == .video }
        case .audio: return trackPublications.filter { $0.kind == .audio }
        }
    }

    var body: some View {
        ForEach(computedTrackPublications()) { trackPublication in
            content(trackPublication)
                .environmentObject(trackPublication)
        }
    }
}
