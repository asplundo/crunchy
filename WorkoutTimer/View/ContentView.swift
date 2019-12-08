//
// Created by me


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var settings = TimerSettings(sets: 5, duration: 30)
    
    var body: some View {
        NavigationView {
            VStack {
                TimerView(settings: settings)
                    .frame(width: 300, height: 300, alignment: .center)
                    .transition(.slide)
                Spacer()
                if settings.state == .idle {
                    Group {
                        SettingsView(settings: settings)
                        Button("Start") {
                            self.settings.getReady()
                        }
                    }
                } else {
                    Button("Reset") {
                        self.settings.reset()
                    }
                }
            }
            .padding()
            .navigationBarTitle("CrunchY")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
