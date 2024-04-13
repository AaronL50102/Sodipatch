//
//  ContentView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var view: Int = 1
    
    var body: some View {
        ZStack{
            if view == 1{
                GraphView()
            }
            if view == 2{
                CalenderView()
//                CalenderView(interval: DateInterval(start: .distantPast, end: .distantFuture))
            }
            if view == 3{
                DietView()
            }
            VStack{
                Spacer()
                ZStack{
                    HStack{
                        Button {
                            view = 1
                        } label: {
                            Image(systemName: "chart.bar.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(view == 1 ? .blue: .black)
                        }
                        Spacer()
                        Button {
                            view = 2
                        } label: {
                            Image(systemName: "calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(view == 2 ? .blue: .black)

                        }
                        Spacer()
                        Button {
                            view = 3
                        } label: {
                            Image("food")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(view == 3 ? .blue: .black)

                        }
                    }
                    .padding([.leading, .trailing], 70)
                    .padding(.bottom, 10)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
