//
//  SingleFlight.swift
//  TravelingApp
//
//  Created by Usman Mukhtar on 15/08/2020.
//

import SwiftUI

struct SingleFlight: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var rating = 4
    
    var rows = Array(repeating: GridItem(.fixed(60)), count: 1)
    
    var body: some View {
        VStack {
            ZStack (alignment: .top){
                ZStack {
                    Color.blue
                    
                    Image(systemName: "airplane")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(Color.white.opacity(0.2))
                        .rotationEffect(Angle(degrees: -45))
                        .frame(height: 260)
                }
                .clipShape(CustomShape(leftCorner: .bottomLeft, rightCorner: .bottomRight, radii: 30))
                .frame(height: 260)
                
                ZStack {
                    VStack {
                        HStack(spacing: 20){
                            VStack(alignment: .leading){
                                Text("KNO")
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                
                                Text("12:33")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("HND")
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                
                                Text("15.21")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack {
                            Text("Garuda Indonesia")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            RatingView(rating: $rating)
                        }.padding(.top, 20)
                        
                        HStack {
                            Text("Company logo")
                                .font(.subheadline)
                                .foregroundColor(Color.gray.opacity(0.5))
                            
                            Spacer()
                            
                            Text("120k review")
                                .foregroundColor(Color.gray)
                        }
                        
                        HStack{
                            VStack (alignment: .leading){
                                Text("Code")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .leading){
                                Text("Class")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                
                                Text("Economy")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .leading){
                                Text("Terminal")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                
                                Text("A")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .leading){
                                Text("Gate")
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                
                                Text("221")
                                    .font(.headline)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        .padding(.vertical, 20)
                        
                        Divider()
                        
                        HStack {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color.blue.opacity(0.1))
                                        .frame(width: 40, height: 40)
                                    
                                    Text("2")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                        .fontWeight(.bold)
                                }
                                
                                Text("Child")
                                    .font(.title3)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .fontWeight(.semibold)
                            }
                            
                            Spacer()
                            
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color.blue.opacity(0.1))
                                        .frame(width: 40, height: 40)
                                    
                                    Text("4")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                        .fontWeight(.bold)
                                }
                                
                                Text("Adults")
                                    .font(.title3)
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .fontWeight(.semibold)
                            }
                        }.padding(.top, 20)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)
                .padding(.bottom, 80)
                .background(Color.white)
                .frame(width: UIScreen.main.bounds.width * 0.85)
                .clipShape(ZigZag())
                .clipShape(CustomShape(leftCorner: .topLeft, rightCorner: .topRight, radii: 20))
                .offset(y: 150)
                .shadow(color: Color.gray.opacity(0.2), radius: 20, x:0, y:10)
            }
            
            VStack(alignment: .leading) {
                Text("Facilities")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: rows, spacing: 10){
                        ForEach(bData) { item in
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(item.color)
                                .frame(width: 140, height: 55)
                                .overlay(
                                    HStack (spacing: 20){
                                        Image(systemName: item.icon)
                                            .font(Font.title.bold())
                                        
                                        Text(item.title)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(.white)
                                )
                        }
                    }
                }
                
                HStack {
                    Text("Total you'll pay")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("$ 145,00")
                        .foregroundColor(.blue)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top,50)
                .padding(.trailing, 40)
            }
            .padding(.top,10)
            .padding(.leading, 40)
            .offset(y: 150)
            
            Spacer()
            
            Button(action: {
                
            }){
                Text("BOOK FLIGHT")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color.blue)
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.5), radius: 6, x:0, y:6)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Image(systemName: "chevron.left")
                                        .font(Font.title2.bold())
                                        .foregroundColor(.white)
                                })
    }
}

struct ZigZag: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - (rect.maxX / 8), y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 2), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 3), y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 4), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 5), y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 6), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 7), y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.maxX - ((rect.maxX / 8) * 8), y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
    
    
}

struct Buttons: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var color: Color
}
 
var bData = [
    Buttons(title: "Snacks", icon: "bag.fill", color: Color.green),
    Buttons(title: "Wifi", icon: "wifi", color: Color.purple),
    Buttons(title: "People", icon: "person.2.fill", color: Color.orange),
    Buttons(title: "Transport", icon: "tram.fill", color: Color.blue),
]

