//
//  CalendarView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/13/24.
//

import SwiftUI

struct CalendarView: View {
    
    let view = UICalendarView()
    @State private var date = Date()

    var body: some View {
        VStack{
            
            Text("TRACK YOUR HISTORY")
                .fontWeight(.heavy)
                .font(.system(size: 27))
                .padding(.top, 20)
//            Text(Date.now, format: .dateTime.hour().minute())
            Spacer()
            DatePicker("Start Date", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding(20)
                .scaleEffect(0.9)
//            CalendarModel(interval: DateInterval(start: .distantPast, end: .distantFuture))
//                .scaleEffect(0.85)
            HStack{
                Text("SODIUM LEVEL")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text(date.formatted(date: .long, time: .omitted))
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding([.leading, .trailing], 35)
            .offset(y: -20)
            HStack{
                VStack{
                    Text("\(Data.arbitraryAverage(date: date.formatted(date: .long, time: .omitted)))")
                        .fontWeight(.heavy)
                        .font(.system(size: 50))
                        .frame(alignment: .leading)
                        .offset(y: -30)
                    Text("mEq/L")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.302))
                        .fontWeight(.bold)
                        .offset(x: 30, y: -40)
                }
                VStack{
                    Text(Data.arbitraryState(date: date.formatted(date: .long, time: .omitted)))//Change later according to actual level
                        .fontWeight(.bold)
                        .foregroundColor(Data.arbitraryState(date: date.formatted(date: .long, time: .omitted)) == "Moderate / Normal" ? .green : .red)
                        .font(.system(size: 10))
                    Text("Daily Avg.")
                        .font(.system(size: 20))
                    Spacer()
                }
                .offset(x: 10)
                Spacer()
            }
            .padding(.leading, 45)
            
            
            switch (date.formatted(date: .long, time: .omitted)){
            case "April 15, 2024":
                ArbitraryGraph(data:[
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*4), level: 784),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*3), level: 603),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*2), level: 927),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600), level: 715),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 0), level: 563)
                ])
            case "April 16, 2024":
                ArbitraryGraph(data:[
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*4), level: 1024),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*3), level: 924),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*2), level: 1124),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600), level: 824),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 0), level: 899)
                ])
            case "April 17, 2024":
                ArbitraryGraph(data:[
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*4), level: 832),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*3), level: 569),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*2), level: 718),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600), level: 654),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 0), level: 812)
                ])
            default:
                ArbitraryGraph(data:[
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*4), level: 879),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*3), level: 526),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600*2), level: 940),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 21600), level: 602),
                    sodiumData(time: Date(timeIntervalSinceReferenceDate: 0), level: 714)
                ])
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
