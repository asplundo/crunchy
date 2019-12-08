//
// Created by me
  

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var settings: TimerSettings
    
    var body: some View {
        let sets = Binding<Int>(
            get: { self.settings.sets },
            set: { self.settings.sets = $0 })
        
        let duration = Binding<Int>(
            get: { self.settings.duration },
            set: { self.settings.duration = $0 })
        
        return Group {
            Stepper("Sets: \(sets.wrappedValue)", value: sets, in: 1...10)
            Stepper("Seconds per set: \(duration.wrappedValue)", value: duration, in: 5...60, step: 5)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: TimerSettings(sets: 5, duration: 5))
    }
}
