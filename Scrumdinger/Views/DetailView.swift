import SwiftUI

struct DetailView: View {
    @State private var isPresentingEditView: Bool = false
    
    let scrum: DailyScrum
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Meeting Info")) {
                    NavigationLink(destination: MeetingView()) {
                        Label("Start Meeting", systemImage: "timer")
                            .foregroundColor(.blue)
                            .font(.headline)
                    }
                    
                    HStack {
                        Label("Lengh", systemImage:  "clock")
                        Spacer()
                        Text("\(scrum.lengthInMinutes) minute")
                    }
                    .accessibilityElement(children: .combine)
                    
                    HStack {
                        Label("Theme", systemImage: "paintpalette")
                        Spacer()
                        Text(scrum.theme.name)
                            .padding(4)
                            .background(scrum.theme.mainColor)
                            .cornerRadius(4)
                            .shadow(radius: 4)
                    }
                }
                
                Section(header: Text("Attendees")) {
                    ForEach(scrum.attendees) { attendee in
                        Label("\(attendee.name)", systemImage: "person")
                    }
                }
            }
            .navigationTitle(scrum.title)
            .toolbar {
                Button {
                    isPresentingEditView = true
                } label: {
                    Text("Edit")
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationView {
                    DetailEditView()
                        .navigationTitle(scrum.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                }
                            }
                        }
                }
            }
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
