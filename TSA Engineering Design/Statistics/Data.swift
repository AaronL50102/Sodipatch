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
    static var lvls = [0, 0, 0, 0, 0, 0]
    
    init(lvls: [Int]) {
        Data.lvls = lvls
    }
    
    func setLvls(lvls: [Int]){
        Data.lvls = lvls
    }
}
