//
//  BottomTabBar.swift
//  TravelingApp
//
//  Created by Usman Mukhtar on 15/08/2020.
//

import SwiftUI

struct BottomTabBar: View {
    
    @State var index = 1
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }) {
                VStack {
                    if self.index != 0 {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                        
                        Text("My Booking")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                    }
                    else {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                            .padding()
                            .font(.title2)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y:5)
                            .offset(y: -10)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                self.index = 1
            }) {
                VStack {
                    if self.index != 1 {
                        Image(systemName: "map.fill")
                            .foregroundColor(.gray)
                        
                        Text("Explore")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                    }
                    else {
                        Image(systemName: "map.fill")
                            .foregroundColor(.white)
                            .padding()
                            .font(.title2)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y:5)
                            .offset(y: -10)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                self.index = 2
            }) {
                VStack {
                    if self.index != 2 {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.gray)
                        
                        Text("Profile")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                    }
                    else {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                            .padding()
                            .font(.title2)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y:5)
                            .offset(y: -10)
                    }
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .background(Color.white)
        .animation(.spring())
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}
