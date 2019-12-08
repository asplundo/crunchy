//
// Created by me


import SwiftUI

struct TimerView: View {
    
    @ObservedObject var settings: TimerSettings
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.blue, lineWidth: 20)
                .opacity(0.2)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.blue, lineWidth: 20)
                .rotationEffect(Angle(degrees:-90))
                .animation(.linear)
            Text(timeString)
                .font(.largeTitle)
        }
    }
            
    var progress: CGFloat {
        return CGFloat(Float(settings.countDown) / Float(settings.duration))
    }
    
    var timeString: String {
        let hours = Int(settings.countDown) / 3600
        let minutes = Int(settings.countDown) / 60 % 60
        let seconds = Int(settings.countDown) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(settings: TimerSettings())
    }
}
