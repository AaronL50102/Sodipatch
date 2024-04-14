//
//  CalendarView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/13/24.
//

import SwiftUI

struct CalendarView: View {
    
    let view = UICalendarView()

    var body: some View {
        VStack{
            Text("TRACK YOUR HISTORY")
                .fontWeight(.heavy)
                .font(.system(size: 27))
                .padding(.top, 60)
//            Text(Date.now, format: .dateTime.hour().minute())
            Spacer()
            CalendarModel(interval: DateInterval(start: .distantPast, end: .distantFuture))
                .scaleEffect(0.85)
            HStack{
                Text("SODIUM LEVEL")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text("[Insert Date]")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding([.leading, .trailing], 35)
            .offset(y: -20)
            HStack{
                VStack{
                    Text("\(Data.average())")
                        .fontWeight(.heavy)
                        .font(.system(size: 50))
                        .frame(alignment: .leading)
                    Text("mEq/L")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.302))
                        .fontWeight(.bold)
                        .offset(x: 30, y: -10)
                }
                VStack{
                    Text(Data.state())//Change later according to actual level
                        .fontWeight(.bold)
                        .foregroundColor(Data.state() == "Moderate / Normal" ? .green : .red)
                        .font(.system(size: 10))
                    Text("Daily Avg.")
                        .font(.system(size: 20))
                    Spacer()
                }
                .offset(x: 10)
                Spacer()
            }
            .padding(.leading, 45)
            GraphModel(width: 290, height: 100)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
