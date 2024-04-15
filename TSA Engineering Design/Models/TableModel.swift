//
//  TableModel.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/14/24.
//

import SwiftUI

struct TableModel: View {
    
    @State var sodiumData = Data.data
    @State var interval: Double = 1
    
    var body: some View {
        let timer = Timer.publish(every: interval == 1 ? 1 : 30, on: .main, in: .common).autoconnect()

        TimelineView(.periodic(from: .now, by: 1)) {
            context in
                VStack{
                    Button {
                        interval *= -1
                    } label: {
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Image(systemName: "clock")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }
                        .padding(.trailing, 55)
                        .padding(.top, 10)
                    }
                    ZStack{
                    Rectangle()
                        .foregroundColor(.blue.opacity(0.3))
                        .frame(width: 240, height: 280)
                        .cornerRadius(20)
                        .offset(y: -50)
                    HStack{
                        VStack{
                            Text("Time")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(10)
                            Text("\(sodiumData[0].time)")
                                .padding(3)
                            Text("\(sodiumData[1].time)")
                                .padding(3)
                            Text("\(sodiumData[2].time)")
                                .padding(3)
                            Text("\(sodiumData[3].time)")
                                .padding(3)
                            Text("\(sodiumData[4].time)")
                                .padding(3)
                            Text("\(sodiumData[5].time)")
                                .padding(3)
                        }
                        Spacer()
                        VStack{
                            Text("Level")                    .font(.headline)
                                .fontWeight(.bold)
                                .padding(10)
                            Text("\(sodiumData[0].value)")
                                .padding(3)
                            Text("\(sodiumData[1].value)")
                                .padding(3)
                            Text("\(sodiumData[2].value)")
                                .padding(3)
                            Text("\(sodiumData[3].value)")
                                .padding(3)
                            Text("\(sodiumData[4].value)")
                                .padding(3)
                            Text("\(sodiumData[5].value)")
                                .padding(3)
                        }
                    }
                    .padding([.leading, .trailing], 100)
                    //.padding(.bottom, 140)
                    .onReceive(timer) { _ in
//                        Data.updateDataArray(value: sodiumData2, interval: interval == 1 ? 1 : 30)
//                        Data.updateData(value: Int.random(in: 700..<1024), interval: interval == 1 ? 1 : 30)//NEW INPUT GOES HERE, DELETE Int.random(in: 700..<1024)
                        self.sodiumData = Data.data
                    }
                    .offset(y: -50)
                }
                }
            }
        .offset(y: -30)
    }
}

struct TableModel_Previews: PreviewProvider {
    static var previews: some View {
        TableModel()
    }
}
