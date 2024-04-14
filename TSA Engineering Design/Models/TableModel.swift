//
//  TableModel.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/14/24.
//

import SwiftUI

struct TableModel: View {
    
    @State var sodiumData = Data.data
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) {
            context in
                HStack{
                    VStack{
                        Text("Time")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(10)
                        Text("\(sodiumData[0].time)")
                            .padding(10)
                        Text("\(sodiumData[1].time)")
                            .padding(10)
                        Text("\(sodiumData[2].time)")
                            .padding(10)
                        Text("\(sodiumData[3].time)")
                            .padding(10)
                        Text("\(sodiumData[4].time)")
                            .padding(10)
                        Text("\(sodiumData[5].time)")
                            .padding(10)
                    }
                    Spacer()
                    VStack{
                        Text("Level")                    .font(.headline)
                            .fontWeight(.bold)
                            .padding(10)
                        Text("\(sodiumData[0].value)")
                            .padding(10)
                        Text("\(sodiumData[1].value)")
                            .padding(10)
                        Text("\(sodiumData[2].value)")
                            .padding(10)
                        Text("\(sodiumData[3].value)")
                            .padding(10)
                        Text("\(sodiumData[4].value)")
                            .padding(10)
                        Text("\(sodiumData[5].value)")
                            .padding(10)
                    }
                }
                .padding(100)
                .onReceive(timer) { _ in
                    self.sodiumData = Data.data
                }
            }
    }
}

struct TableModel_Previews: PreviewProvider {
    static var previews: some View {
        TableModel()
    }
}
