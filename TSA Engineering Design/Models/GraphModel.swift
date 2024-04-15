//
//  GraphModel.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/13/24.
//

import SwiftUI
import Charts

struct GraphModel: View {
    
    var width: CGFloat = 300
    var height: CGFloat = 250
    @State var sodiumData = Data.data
    var data: [(type: String, values: [Data])]{
        [(type: "Sodium", values: sodiumData)]
    }
    @State var interval: Double = 1
    @State var sodiumData2: [Double] = [0, 0, 0, 0, 0, 0]
    
    var body: some View {
        
        let timer = Timer.publish(every: interval == 1 ? 1 : 30, on: .main, in: .common).autoconnect()
        TimelineView(.periodic(from: .now, by: 1)) {
            context in
            VStack{
                Button {
                    interval *= -1
                } label: {
                    HStack{
                        Spacer()
                        Image(systemName: "clock")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 55)
                    .padding(.bottom, 45)
                }

                Chart(data, id: \.type) { dataSeries in
                    ForEach(dataSeries.values) { data in
                        let _ = print(data.value)
                        LineMark(
                            x: .value("Time", data.time),
                            y: .value("Level", data.value))
                    }
                    //.foregroundStyle(by: .value("Sodium", dataSeries.type))
                    .symbol(by: .value("Sodium", dataSeries.type))
                }
                .frame(width: width, height: height)
                .chartYScale(domain: (Data.values.min() ?? 0)...(Data.values.max() ?? 1))
                .chartXScale(domain: Data.data[0].time...Data.data[5].time)
                .chartYAxis{
                    AxisMarks(values: Data.values)
                }
                .offset(y: -50)
                .aspectRatio(1, contentMode: .fit)
                .padding(.all, 10)
                .onReceive(timer) { _ in
//                    Data.updateData(value: Int.random(in: 700..<1024), interval: interval == 1 ? 1 : 30)//NEW INPUT GOES HERE, DELETE Int.random(in: 700..<1024)
//                    Data.updateDataArray(value: sodiumData2, interval: interval == 1 ? 1 : 30)
                    self.sodiumData = Data.data
                }
            }
        }
    }
}

struct GraphModel_Previews: PreviewProvider {
    static var previews: some View {
        GraphModel()
    }
}
