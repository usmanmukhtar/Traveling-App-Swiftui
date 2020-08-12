//
//  ContentView.swift
//  TravelingApp
//
//  Created by Usman Mukhtar on 10/08/2020.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var show = false
    @State private var animationAmount: CGFloat = 1
    var rows = Array(repeating: GridItem(.fixed(270)), count: 1)

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                SearchView(text: .constant(""))

                HStack {
                    Text("Trending destinations")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("View all")
                            .font(.subheadline)
                    }
                }.padding(.top, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid (rows: rows, spacing: 20) {
                        ForEach(dData){ destination in
                            GeometryReader { geometry in
                                NavigationLink(destination: DetailedView()){
                                    CardView(destination: destination, minX: geometry.frame(in: .global).minX )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .frame(maxHeight: .infinity)
                            .frame(width: 205)
                        }
                    }
                }
                
                HStack {
                    Text("Top 10 destinations")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                }.padding(.top, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid (rows: Array(repeating: GridItem(.fixed(65)), count: 1), spacing: 20) {
                        ForEach(0..<10, id: \.self){ i in
                            VStack {
                                ZStack {
                                    Circle()
                                        .strokeBorder(Color.blue.opacity(0.6), lineWidth: 3)
                                        .frame(width: 65, height: 65)
                                    
                                    Image("Japan")
                                        .resizable()
                                        .frame(width: 55, height: 55)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                }
                                
                                Text("JAPAN")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .onTapGesture {
                                withAnimation(.default) {
                                    self.show.toggle()
                                }
                            }
                        }
                    }
                }
                Spacer()
                
                
            }
                .padding()
                
//                if self.show {
//                    withAnimation(.default){
//                        StoryView(show: $show)
//                    }
//                }
            }
            .navigationBarTitle(Text("Explore"))
            .navigationBarItems(trailing:
                ZStack {
                    Button(action: {
                        print("tapped")
                    }) {
                        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top)){
                            Image(systemName: "bell.circle")
                                .font(.title)
                                .foregroundColor(.gray)
                            
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                        }
                    }.position(x: 0, y: 60)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Destination: Identifiable {
    var id = UUID()
    var title: String?
    var subTitle: String?
    var numOfAirlines: String?
}

var dData = [
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "15"),
]
