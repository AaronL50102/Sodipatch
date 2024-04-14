//
//  CalendarModel.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/13/24.
//

import SwiftUI

//
//  CalendarView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/13/24.
//

import SwiftUI

struct CalendarModel: UIViewRepresentable {
    let interval: DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        //view.bounds = view.frame.insetBy(dx: 200, dy: 200)
        return view
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return dateComponents != nil
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
}

