//
// Created by me


import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var settings: TimerSettings
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let sets = Binding<Int>(
            get: { self.settings.sets },
            set: { self.settings.sets = $0 }
        )
        
        let duration = Binding<Int>(
            get: { self.settings.duration },
            set: { self.settings.duration = $0 }
        )
        
        let getReadyTime = Binding<Double>(
            get: { self.settings.getReadyTime },
            set: { self.settings.getReadyTime = $0 }
        )
        
        return NavigationView {
            Form {
                Section(header: Text("Number of sets")) {
                    Stepper("\(sets.wrappedValue)", value: sets, in: 1...10)
                }
                Section(header: Text("Seconds per set")) {
                    Stepper("\(duration.wrappedValue)", value: duration, in: 5...60, step: 5)
                }
                Section(header: Text("Seconds between sets")) {
                    Stepper("\(Int(getReadyTime.wrappedValue))", value: getReadyTime, in: 1...5)
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: TimerSettings())
    }
}
