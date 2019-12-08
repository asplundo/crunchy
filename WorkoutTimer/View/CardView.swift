//
// Created by me


import SwiftUI

struct CardView: View {
    
    @ObservedObject var settings: TimerSettings
    
    var body: some View {
        VStack {
            Group {
                Text("\(settings.sets) sets")
                Text("\(settings.duration) seconds each set")
                Text("\(Int(settings.getReadyTime)) seconds between sets")
            }
            .font(.title)
        }
        .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 5)
        )
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(settings: TimerSettings())
    }
}
