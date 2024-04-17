//
//  DietView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/18/24.
//

import SwiftUI

struct DietView: View {
    var body: some View {
        VStack{
            Text("Your Dietary Recommendations")
                .fontWeight(.heavy)
                .font(.system(size: 30))
                .padding(.top, 20)
            HStack{
                Text("Status: ")
                    .fontWeight(.bold)
                Text("! High Sodium")//Change to according to actual states if needed
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Spacer()
            }
            .padding(.top, 5)
            .padding(.leading, 60)
            HStack{
                Text("High Potassium Foods")//Change to according to actual states if needed
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Spacer()
            }
            .padding(.top, 5)
            .padding(.leading, 60)
            ZStack{
                Rectangle()
                    .foregroundColor(.orange.opacity(0.6))
                    .frame(width: 340, height: 170)
                    .cornerRadius(20)
                VStack{
                    HStack{
                        Text("Fruits")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    .padding(.leading, 60)
                    HStack{
                        Image("banana")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.2)
                            .offset(x: -30)
                        Spacer()
                        Image("avocado")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.3)
                        Spacer()
                        Image("apricot")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.3)
                            .offset(x: 30)
                    }
                    .padding([.leading, .trailing], 70)
                    HStack{
                        Text("Banana")
                        Spacer()
                        Text("Avocado")
                        Spacer()
                        Text("Apricot")
                    }
                    .padding([.leading, .trailing], 55)
                }
            }
            .scaleEffect(0.9)
            .offset(y: -10)
            ZStack{
                Rectangle()
                    .foregroundColor(.green.opacity(0.4))
                    .frame(width: 340, height: 170)
                    .cornerRadius(20)
                VStack{
                    HStack{
                        Text("Vegetables")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    .padding(.leading, 60)
                    HStack{
                        Image("spinach")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(0.9)
                        Spacer()
                        Image("broccoli")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(0.9)
                    }
                    .padding([.leading, .trailing], 70)
                    HStack{
                        Spacer()
                        Text("Banana")
                        Spacer()
                        Text("Apricot")
                        Spacer()
                    }
                    .padding([.leading, .trailing], 55)
                }
            }
            .scaleEffect(0.9)
            .offset(y: -30)
            ZStack{
                Rectangle()
                    .foregroundColor(.purple.opacity(0.4))
                    .frame(width: 340, height: 170)
                    .cornerRadius(20)
                VStack{
                    HStack{
                        Text("Protein")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    .padding(.leading, 60)
                    HStack{
                        Image("salmon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.2)
                            .offset(x: -30)
                        Spacer()
                        Image("kidneyBeans")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.3)
                        Spacer()
                        Image("chickenbreast")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(1.3)
                            .offset(x: 30)
                    }
                    .padding([.leading, .trailing], 70)
                    HStack{
                        Text("Salmon")
                        Spacer()
                        Text("Kidney Beans")
                        Spacer()
                        Text("Chicken Breast")
                    }
                    .padding([.leading, .trailing], 55)
                }
            }
            .scaleEffect(0.9)
            .offset(y: -50)


        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
