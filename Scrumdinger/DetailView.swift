import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Meeting Info")) {
                    Label("Start Meeting", systemImage: "timer")
                        .foregroundColor(.blue)
                        .font(.headline)
                    HStack {
                        Label("Lengh", systemImage:  "clock")
                        Spacer()
                        Text("\(scrum.lengthInMinutes) minute")
                    }
                    .accessibilityElement(children: .combine)
                    
                    HStack {
                        Label("Theme", systemImage: "paintpalette")
                    }
                }
            }.navigationTitle("Meetings")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
