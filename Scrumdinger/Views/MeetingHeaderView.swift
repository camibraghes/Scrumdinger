
import SwiftUI

struct MeetingHeaderView: View {
    let secondElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSecound: Int {
        secondElapsed + secondRemaining
    }
    
    private var progress: Double {
        guard totalSecound > 0 else { return 1}
        return Double(secondElapsed) / Double(totalSecound)
    }
    
    private var minuteRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            HStack {
                VStack {
                    Text("Seconds Elapsed")
                    Label("\(secondElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                .font(.caption)
            
                Spacer()
                
                VStack {
                    Text("Seconds Remaining")
                    Label("\(secondRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
                .font(.caption)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minuteRemaining) minutes")
            .padding([.top, .horizontal])
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondElapsed: 10, secondRemaining: 130, theme: .magenta)
    }
}
