//
//  ContentView.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @StateObject var scrumTimer = ScrumTimer()
    @StateObject var speechRecognizer = SpeechRecognizer()
    @Binding var scrum : DailyScrum
    @State var isRecording = false
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining,theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme,isRecording: isRecording)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .onAppear() {
            startScrum()
        }
        .onDisappear() {
            stopScrum()
        }
        .foregroundStyle(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        isRecording = true
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        scrumTimer.startScrum()
    }
    
    private func stopScrum() {
        scrumTimer.stopScrum()
        isRecording = false
        speechRecognizer.stopTranscribing()
        let history = History(attendees: scrum.attendees, transcript: speechRecognizer.transcript)
        scrum.history.insert(history,at:0)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
