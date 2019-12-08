//
// Created by me


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var settings = TimerSettings()
    @State private var displaySettings = false
    
    var body: some View {
        NavigationView {
            VStack {
                TimerView(settings: settings)
                    .frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.width * 0.65, alignment: .center)
                Spacer()
                if settings.state == .idle {
                    CardView(settings: settings)
                        .animation(.default)
                        .transition(.slide)
                    Spacer()
                    Button("Start") {
                        self.settings.getReady()
                    }
                } else {
                    if settings.state == .getReady {
                        Text("GET READY...")
                            .font(.largeTitle)
                            .animation(.default)
                            .transition(.slide)
                        Spacer()
                    }
                    Button("Reset") {
                        self.settings.reset()
                    }
                }
            }
            .padding()
            .sheet(isPresented: $displaySettings) {
                SettingsView(settings: self.settings)
            }
            .navigationBarTitle("CrunchY")
            .navigationBarItems(trailing: Button("Settings") {
                self.displaySettings = true
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
