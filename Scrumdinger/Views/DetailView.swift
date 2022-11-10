import SwiftUI

struct DetailView: View {
    @State private var isPresentingEditView: Bool = false
    @State private var data = DailyScrum.Data()
    
    @Binding var scrum: DailyScrum
    
    var body: some View {
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
                data = scrum.data
            } label: {
                Text("Edit")
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
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
                                scrum.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
