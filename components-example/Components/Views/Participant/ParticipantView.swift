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

public struct ParticipantInfoBar: View {

    @EnvironmentObject var participant: Participant
    @EnvironmentObject var ui: UIConfiguration

    public var body: some View {

        HStack(spacing: ui.paddingSmall) {
            Text(participant.identity)

            if let audio = participant.firstAudioPublication {
                TrackPublicationStateBuilder {
                    ui.micOnBuilder()
                } off: {
                    ui.micOffBuilder()
                }.environmentObject(audio)
            } else {
                ui.micOffBuilder()
            }

            ConnectionQualityIndicatorView()
        }
    }
}

public struct ParticipantView: View {

    @EnvironmentObject var participant: Participant
    @EnvironmentObject var ui: UIConfiguration

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                if let trackPublication = participant.firstCameraPublication {
                    VideoTrackPublicationView()
                        .environmentObject(trackPublication)
                } else {
                    ui.noVideoBuilder(geometry: geometry)
                }
                ParticipantInfoBar()
                    .padding(5)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.black.opacity(0.5))
            }
        }
    }
}
