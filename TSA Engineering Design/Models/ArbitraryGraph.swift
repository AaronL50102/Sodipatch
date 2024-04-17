//
//  GraphModel.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/13/24.
//

import SwiftUI
import Charts

struct sodiumData {
    let time: Date
    let level: Double
    
    static let data: [sodiumData] = [
        sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*4), level: 1024),
        sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*3), level: 924),
        sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*2), level: 1124),
        sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600), level: 824),
        sodiumData(time: Date(timeIntervalSinceReferenceDate: 0), level: 1024)
    ]
}

struct ArbitraryGraph: View {
    
    @State var data = sodiumData.data

//    @State var sodiumData = [
//        Data(time: 12, value: 1024),
//        Data(time: 13, value: 1024),
//        Data(time: 14, value: 1024),
//        Data(time: 15, value: 1024),
//        Data(time: 16, value: 1024),
//        Data(time: 17, value: 1024)
//    ]
//    var data: [(type: String, values: [Data])]{
//        [(type: "Sodium", values: sodiumData)]
//    }

    var body: some View {
        VStack{
            Chart(data, id: \.time) { data in
                LineMark(
                    x: .value("Time", data.time..<data.time.advanced(by: 1800)),
                    y: .value("Sodium level", data.level)
                )
            }
            .frame(width: 290, height: 120)
            .chartXAxis {
                AxisMarks(values: .stride(by: .hour, count: 6)) { value in
                        let hour = Calendar.current.component(.hour, from: Date(timeIntervalSinceReferenceDate: 0))
                        switch hour {
                        case 0, 12:
                            AxisValueLabel(format: .dateTime.hour())
                        default:
                            AxisValueLabel(format: .dateTime.hour(.defaultDigits(amPM: .abbreviated)))
                        }
                }
            }
            .offset(y: -50)
            .aspectRatio(1, contentMode: .fit)
            .padding(.all, 10)
        }
    }
}

struct ArbitraryGraph_Previews: PreviewProvider {
    static var previews: some View {
        ArbitraryGraph()
    }
}
