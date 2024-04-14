//
//  TableModel.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 4/14/24.
//

import SwiftUI

struct TableModel: View {
    
    @State var sodiumData = Data.data
    
    var body: some View {
        VStack{
            Table(sodiumData) {
                TableColumn("Time") { data in
                    Text(String(data.time))
                }
                TableColumn("Level") { data in
                    Text(String(data.value))
                }
            }
        }
    }
}

struct TableModel_Previews: PreviewProvider {
    static var previews: some View {
        TableModel()
    }
}
