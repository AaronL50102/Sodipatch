//
//  Data.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/18/24.
//

import Foundation
import SwiftUI

struct Data: Identifiable, Equatable {
    //Ignore this ID
    var id = UUID()
    var time: Int
    var value: Int
    
    static var values = [1024, 924, 824, 724, 624, 524]
    
    static var data: [Data] = [
        Data(time: Calendar.current.component(.second, from: Date.now)-5, value: values[0]),
        Data(time: Calendar.current.component(.second, from: Date.now)-4, value: values[1]),
        Data(time: Calendar.current.component(.second, from: Date.now)-3, value: values[2]),
        Data(time: Calendar.current.component(.second, from: Date.now)-2, value: values[3]),
        Data(time: Calendar.current.component(.second, from: Date.now)-1, value: values[4]),
        Data(time: Calendar.current.component(.second, from: Date.now), value: values[5])
    ]
    
    static func state() -> String {
        var stateMessage = String()
        //Change these values accordingly
        if data[5].value <= 100 {
            stateMessage = "! Low Sodium"
        }
        else if data[5].value <= 125 {
            stateMessage = "Moderate / Normal"
        }
        else {
            stateMessage = "! High Sodium"
        }
        return stateMessage
    }
    
    static func average() -> Int {
        return (data[5].value + data[4].value + data[3].value + data[2].value + data[1].value + data[0].value) / 6
    }
    
    static func updateData(value: Int, interval: Int){
        let time = data[5].time + interval
        data.remove(at: 0)
        data.append(Data(time: time, value: value))
        values.remove(at: 0)
        values.append(value)
    }
    
    static func updateDataArray(value: [Double], interval: Int){
        let time5 = data[5].time + interval
        let time4 = data[5].time
        let time3 = data[4].time
        let time2 = data[3].time
        let time1 = data[2].time
        let time0 = data[1].time
        
        for i in 0..<data.count{
            data.remove(at: i)
        }
        
        data.append(Data(time: time0, value: Int(value[0])))
        data.append(Data(time: time1, value: Int(value[1])))
        data.append(Data(time: time2, value: Int(value[2])))
        data.append(Data(time: time3, value: Int(value[3])))
        data.append(Data(time: time4, value: Int(value[4])))
        data.append(Data(time: time5, value: Int(value[5])))


    }
}
