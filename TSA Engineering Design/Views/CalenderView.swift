//
//  CalenderView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/18/24.
//

import SwiftUI

//struct CalendarView: UIViewRepresentable{
//    let interval: DateInterval
//    func makeUIView(context: Context) -> UICalendarView {
//        let view = UICalendarView()
//        view.calendar = Calendar(identifier: .gregorian)
//        view.availableDateRange = interval
//        return view
//    }
//
//    func updateUIView(_ uiView: UICalendarView, context: Context) {
//
//    }
//}

struct CalenderView: View {

    let calendarView = UICalendarView()

    var body: some View {
        HStack{
            Text("Calendar")
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
