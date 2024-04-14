//
//  GraphView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/18/24.
//

import SwiftUI
import Charts

struct GraphView: View {
    //Remove this later
    
    @State var display: Int = 1
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Good Morning, ABCDE")
                        .fontWeight(.heavy)
                        .font(.system(size: 27))
                        .offset(y: 20)
                    Spacer()
                }.padding(.leading, 30)
                ZStack{
                    Rectangle()
                        .foregroundColor(.blue).opacity(0.3)
                        .cornerRadius(20)
                        .frame(width: 325, height: 130)
                        .padding(.all, 30)
                    VStack{
                        HStack{
                            Text("Health Report")
                                .fontWeight(.heavy)
                                .font(.system(size: 19))
                                .offset(x: -5, y: -7)
                            Spacer()
                        }
                        .padding(.leading, 60)
                        Text("Your sodium levels have increased recently. Strssed? Take a few deep breaths. Check out your diet tab for recommended foods")
                            .font(.system(size: 14))
                            .opacity(0.7)
                            .padding([.leading, .trailing], 52)
                    }
                }
                HStack{
                    Text("NOW")
                    Text(Date.now, format: .dateTime.hour().minute())
                    Spacer()
                    //¯\_(ツ)_/¯
                    ZStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(.black)
                                .opacity(0.7)
                                .frame(width: 100, height: 50)
                                .cornerRadius(10)
                                .offset(x: -50, y: -25)
                            Text("IDK")
                                .foregroundColor(.white)
                                .offset(x: -75, y: -35)
                        }
                        .opacity(display == -1 ? 1: 0)
                        Button {
                            display *= -1
                        } label: {
                            HStack{
                                Spacer()
                                Image(systemName: "exclamationmark.circle.fill")
                                    .foregroundColor(.gray)
                            }.padding(.trailing, 10)
                            
                        }
                    }
                }
                .opacity(0.8)
                .padding([.leading, .trailing], 45)
                TimelineView(.periodic(from: .now, by: 1)) {
                    context in
                    HStack{
                        Text("\(Data.data[5].value) mEQ/L")//Note: assuming most current value is the last index in array. Change if not
                            .font(.system(size: 40))
                            .foregroundColor(Color(hue: 0.637, saturation: 0.953, brightness: 0.572))
                        Spacer()
                    }
                    .padding(.leading, 43)
                    .offset(y: -20)
                }
                HStack{
                    Text(Data.state())//Change later according to actual level
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Spacer()
                }
                .padding(.leading, 45)
                .offset(y: -20)
                GraphModel()
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
