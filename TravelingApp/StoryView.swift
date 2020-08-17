//
//  StoryView.swift
//  TravelingApp
//
//  Created by Usman Mukhtar on 10/08/2020.
//

import SwiftUI
import Combine

struct StoryView: View {
    @Binding var show: Bool
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 5, interval: 3.0)
    
    var imageNames:[String] = ["Japan","Maldives","Paris","Nyc","London"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                Color.black.edgesIgnoringSafeArea(.all)
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                    .animation(.none)
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices) { x in
                        LoadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                }.padding()
            }
            .onAppear { self.storyTimer.start() }
            .onReceive(storyTimer.publisher) { _ in
                if storyTimer.show == false {
            
                    withAnimation(){
                        self.show = storyTimer.show
                    }
                }
            }
            
            HStack(alignment: .center, spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.storyTimer.advance(by: -1)
                }
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.storyTimer.advance(by: 1)
                }
            }
        }
    }
}

struct LoadingRectangle: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
}

class StoryTimer: ObservableObject {
    
    @Published var progress: Double
    private var interval: TimeInterval
    private var max: Int
    let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    var show: Bool
    
    
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
        self.show = true
    }
    
    func start(){
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max {
                newProgress = 0
                self.show = false
                return
            }
            self.progress = newProgress
        })
    }
    
    func advance(by number: Int) {
        var newProgress = (Int(self.progress) + number)
        self.progress = Double(newProgress)
        
        if newProgress == self.max {
            newProgress = 0
            self.progress = Double(newProgress)
            self.show = false
        } else if newProgress < 0 {
            self.progress = 0
        }
    }
}
