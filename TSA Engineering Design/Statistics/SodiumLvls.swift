//
//  SodiumLvls.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/18/24.
//

import Foundation
import SwiftUI

struct SodiumLvls: Identifiable, Equatable {
    //Ignore this ID
    var id = UUID()
    
    var time: Int
    var lvl: Int
    
    static var exampleLvl: [SodiumLvls] {
        [
            SodiumLvls(time: Calendar.current.component(.hour, from: Date.now)-5, lvl: Data.lvls[0]),
            SodiumLvls(time: Calendar.current.component(.hour, from: Date.now)-4, lvl: Data.lvls[1]),
            SodiumLvls(time: Calendar.current.component(.hour, from: Date.now)-3, lvl: Data.lvls[2]),
            SodiumLvls(time: Calendar.current.component(.hour, from: Date.now)-2, lvl: Data.lvls[3]),
            SodiumLvls(time: Calendar.current.component(.hour, from: Date.now)-1, lvl: Data.lvls[4]),
            SodiumLvls(time: Calendar.current.component(.hour, from: Date.now), lvl: Data.lvls[5])
        ]
    }
    
    func state() -> String {
        var stateMessage = String()
        //Change these values accordingly
        if Data.lvls[5] <= 100 {
            stateMessage = "! Low Sodium"
        }
        else if Data.lvls[5] <= 125 {
            stateMessage = "Normal"
        }
        else {
            stateMessage = "!High Sodium"
        }
        return stateMessage
    }
}
