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
                .scaleEffect(0.9)
            HStack{
                Text("SODIUM LEVEL")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text("YESTERDAY")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding([.leading, .trailing], 35)
            .offset(y: -20)
            Text("\(Data.average())")
            GraphModel(width: 300, height: 200)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
