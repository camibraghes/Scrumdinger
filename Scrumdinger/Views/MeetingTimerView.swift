import SwiftUI

struct MeetingTimerView: View {
    let theme: Theme
    let speakers: [ScrumTimer.Speaker]
    
    private var currentSpeaker: String {
        speakers.first(where: {!$0.isCompleted})?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title2)
                    Text("is speaking")
                }
//                .foregroundColor(theme.accentColor)
            }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Jhoana", isCompleted: false), ScrumTimer.Speaker(name: "Anna", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(theme: .magenta, speakers: speakers)
    }
}
