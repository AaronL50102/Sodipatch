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
    var height: CGFloat = 300
    @State var sodiumData = Data.data
    var data: [(type: String, values: [Data])]{
        [(type: "Sodium", values: sodiumData)]
    }

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) {
            context in
            
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
            .frame(width: 300, height: 300)
            .chartYScale(domain: (Data.values.min() ?? 0)...(Data.values.max() ?? 1))
            .chartXScale(domain: Data.data[0].time...Data.data[5].time)
            .chartYAxis{
                AxisMarks(values: Data.values)
            }
            .offset(y: -50)
            .aspectRatio(1, contentMode: .fit)
            .padding(.all, 50)
            .onReceive(timer) { _ in
                Data.updateData(value: Int.random(in: 700..<1024))//NEW INPUT GOES HERE, DELETE Int.random(in: 700..<1024)
                self.sodiumData = Data.data
            }
        }
    }
}


struct GraphModel_Previews: PreviewProvider {
    static var previews: some View {
        GraphModel()
    }
}
