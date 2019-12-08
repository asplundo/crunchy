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
            Text(textForState)
                .animation(.interactiveSpring())
        }
    }
    
    var textForState: String {
        switch settings.state {
        case .getReady:
            return "Get ready..."
        case .running, .idle:
            return timeString
        case .finished:
            return "Great job!"
        }
    }
    
    var progress: CGFloat {
        let diff = Float(settings.countDown) / Float(settings.duration)
        return  CGFloat(1 - diff)
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
        TimerView(settings: TimerSettings(sets: 5, duration: 5))
    }
}
