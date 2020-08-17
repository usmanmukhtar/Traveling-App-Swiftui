//
//  CardView.swift
//  TravelingApp
//
//  Created by Usman Mukhtar on 15/08/2020.
//

import SwiftUI

struct CardView: View {
    var destination: Destination
    var minX: CGFloat
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(destination.numOfAirlines)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("Airlines")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            
            HStack {
                VStack (alignment: .leading){
                    Text("\(destination.subTitle)")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(destination.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .foregroundColor(Color.white.opacity(0.8))
                        .frame(width: 20, height: 20)
                }
            }
        }
        .padding(20)
        .frame(width: 205, height: 260)
        .background(
            Image(destination.title)
                .resizable()
                .scaledToFill()
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .scaleEffect(minX < 0 ? minX / 1000 + 1 : 1)
        .offset(x: minX < 16 ? -minX + 16: 1)
        .opacity(minX < 0 ? Double(minX / 200 + 1): 1)
    }
}
