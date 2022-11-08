import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            
            HStack {
                VStack {
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                .font(.caption)
            
                Spacer()
                
                VStack {
                    Text("Seconds Remaining")
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
                .font(.caption)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}