//
//  ContentView.swift
//  TSA Engineering Design
//
//  Created by Aaron Lin (student LM) on 2/14/24.
//

import SwiftUI

import CoreBluetooth

import Charts


class MyCentralManagerDelegate: NSObject, CBCentralManagerDelegate,
CBPeripheralDelegate, ObservableObject {

    @Published var discoveredDevices: [CBPeripheral] = []

    @Published var receivedData: String = "" // Added variable
    @Published var isConnected: Bool = false

    @Published var connectionMessage: String = ""

    @Published public var sodiumData2: [Double] = []



    var centralManager: CBCentralManager!

    var connectedPeripheral: CBPeripheral?


    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScanningForPeripherals() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("Bluetooth is powered on")
            startScanningForPeripherals()
        case .poweredOff:
            print("Bluetooth is powered off")
        case .resetting:
            print("Bluetooth is resetting")
        case .unauthorized:
            print("Bluetooth is unauthorized")
        case .unknown:
            print("Bluetooth state is unknown")
        case .unsupported:
            print("Bluetooth is unsupported")
            
        @unknown default:
            fatalError("Unknown Bluetooth state")
        }
    }

    func connect(to peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }


    func centralManager(_ central: CBCentralManager, didDiscover
peripheral: CBPeripheral, advertisementData: [String : Any], rssi
RSSI: NSNumber) {
        let esp32DeviceName = "MyESP32"

        if let name = peripheral.name, name == esp32DeviceName {
            if !discoveredDevices.contains(peripheral) {
                discoveredDevices.append(peripheral)
                print("Discovered device: \(name)")
            }
        }
    }
    // Add a new function to handle receiving new values

        func addReceivedValue(_ value: Double) {
            sodiumData2.append(value)
        }

        func centralManager(_ central: CBCentralManager, didConnect
peripheral: CBPeripheral) {
            
            print("Connected to peripheral: \(peripheral)")
            isConnected = true
            connectedPeripheral = peripheral
            peripheral.delegate = self
            peripheral.discoverServices(nil)
            connectionMessage = "Connected to \(peripheral.name ?? "Unknown Device")"
        }


    func centralManager(_ central: CBCentralManager, didFailToConnect
peripheral: CBPeripheral, error: Error?) {

        print("Failed to connect to peripheral: \(peripheral)")

        connectionMessage = "Failed to connect"

    }


    func centralManager(_ central: CBCentralManager,
didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {

        print("Disconnected from peripheral: \(peripheral)")

        isConnected = false

        connectedPeripheral = nil

        connectionMessage = "Disconnected"

    }


    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices
error: Error?) {

        if let services = peripheral.services {

            for service in services {

                peripheral.discoverCharacteristics(nil, for: service)

            }

        }

    }


    func peripheral(_ peripheral: CBPeripheral,
didDiscoverCharacteristicsFor service: CBService, error: Error?) {

        if let characteristics = service.characteristics {

            for characteristic in characteristics {

                if characteristic.properties.contains(.notify) {

                    peripheral.setNotifyValue(true, for: characteristic)

                }

            }

        }

    }


    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor
characteristic: CBCharacteristic, error: Error?) {

        if let data = characteristic.value {

            let stringValue = String(data: data, encoding: .utf8) ??
"" // Convert received data to string

            DispatchQueue.main.async {

                self.receivedData = stringValue // Store received data

            }

            print("Received Data: \(stringValue)")

        }

    }

}

struct ContentView: View {

    @ObservedObject private var bleScanner = MyCentralManagerDelegate()

    @State private var data = MyCentralManagerDelegate()

    @Environment(\.scenePhase) private var scenePhase

    @State private var isIconAnimated = false

    @State var view: Int = 1



    var body: some View {

        NavigationStack {

            ZStack {

                RadialGradient(stops:[

                    .init(color: Color(red:  0.9490, green:  0.9490,
blue:  0.9490), location: 0.8),

                    .init(color: Color(red: 0.7019, green: 0.7019,
blue: 0.7019),location: 0.0),

                ], center: .topLeading, startRadius: 200, endRadius:
600).ignoresSafeArea()



                VStack {

                    Image(systemName: "aqi.medium")

                        .imageScale(.large)
                        .foregroundColor(Color(.init(red: 0.5, green:
                                                        0.802, blue: 0.802, alpha: 0))) //Changed alpha

                        .font(.system(size: 50))

                        .scaleEffect(isIconAnimated ? 1.2 : 1)

                        .animation(.easeInOut(duration:
1).repeatForever(), value: isIconAnimated)

                        .onChange(of: scenePhase) { newPhase in

                            switch newPhase {

                            case .active:

                                isIconAnimated = true

                                print("App is active")

                            case .inactive:

                                isIconAnimated = false

                                print("App is inactive")

                            case .background:

                                isIconAnimated = false

                                print("App is in background")

                            @unknown default:

                                break

                            }

                        }



                    if bleScanner.isConnected {

                        Text("Connected to ESP32!")

                            .padding(.top,10)

                            .foregroundColor(.green)

                            .cornerRadius(10)

                    }

                    else {

                        Text("Not Connected")

                            .padding(.top,10)

                            .foregroundColor(.red)

                            .cornerRadius(10)

                    }



                    if let peripheral = bleScanner.discoveredDevices.first {

                        NavigationStack {

                            VStack(alignment: .leading) {



                                Button(action: {

                                    bleScanner.connect(to: peripheral)

                                    if bleScanner.isConnected {

                                        Text("Connected to ESP32!")

                                            .padding(.top,10)

                                            .foregroundColor(.green)

                                    }

                                    else {

                                        Text("Not Connected")

                                            .padding(.top,10)

                                            .foregroundColor(.red)

                                    }

                                }) {

                                    Text(peripheral.name ?? "Unnamed")

                                        .foregroundStyle(.white)

                                        .font(.title2)

                                        .bold()


                                    if bleScanner.isConnected == true {
                                        
                                        let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
                                        NavigationLink(destination: GraphModel()){
                                            TimelineView(.periodic(from: .now, by: 1)) {
                                                context in
                                                Image(systemName: "arrow")
                                                    .foregroundColor(.white)
                                                    .onReceive(timer) { _ in
                                                        Data.updateDataArray(value: bleScanner.sodiumData2, interval: 30)
                                                    }
                                            }

                                        }

                                        NavigationLink {

                                            Text("Received Data:\(bleScanner.receivedData)")

                                                .foregroundColor(.white)

                                                .padding()

                                            ZStack{

                                                if view == 1{

                                                    GraphView()

                                                }

                                                if view == 2{


                                                }

                                                if view == 3{

                                                    DietView()

                                                }

                                                VStack{

                                                    Spacer()

                                                    ZStack{

                                                        HStack{

                                                            Button {


DispatchQueue.main.asyncAfter(deadline: .now()){

                                                                    view = 1

                                                                }

                                                            } label: {


Image(systemName: "chart.bar.fill")

                                                                    .resizable()


.aspectRatio(contentMode: .fit)


.frame(width: 25, height: 25)


.foregroundColor(view == 1 ? .orange: .blue)

                                                            }

                                                            Spacer()

                                                            Button {

                                                                view = 2

                                                            } label: {


Image(systemName: "calendar")

                                                                    .resizable()


.aspectRatio(contentMode: .fit)


.frame(width: 25, height: 25)


.foregroundColor(view == 2 ? .orange: .blue)


                                                            }

                                                            Spacer()

                                                            Button {

                                                                view = 3

                                                            } label: {

                                                                Image("food")

                                                                    .resizable()


.aspectRatio(contentMode: .fit)


.frame(width: 25, height: 25)


.foregroundColor(view == 3 ? .orange: .blue)


                                                            }

                                                        }


.padding([.leading, .trailing], 70)

                                                        .padding(.bottom, 10)

                                                    }



                                                }

                                            }

                                        } label: {

                                            Text("")

                                            Label("Go to Metrics",
systemImage: "arrow")

                                        }



                                    }

                                }

                            }

                        }.foregroundColor(.blue)

                    }

                    else {

                        Text("Scanning for SodiPatch 1.0:")

                            .font(.title)

                            .padding(.top, 15)

                            .padding(.bottom, 20)

                            .foregroundColor(.white)

                            .underline()



                        Text("No ESP32 device found")

                            .foregroundColor(.white)



                    }

                }.foregroundStyle(.black)

                .padding(50)

                .background(.ultraThinMaterial)

                .cornerRadius(30.0)

                .padding()

                .onAppear {

                    // Start scanning for peripherals when the view appears

                    bleScanner.startScanningForPeripherals()

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


//import SwiftUI
//
//struct ContentView: View {
//
//    @State var view: Int = 1
//
//    var body: some View {
//        ZStack{
//            if view == 1{
//                GraphView()
//            }
//            if view == 2{
//                CalendarView()
//            }
//            if view == 3{
//                DietView()
//            }
//            VStack{
//                Spacer()
//                ZStack{
//                    HStack{
//                        Button {
//                            DispatchQueue.main.asyncAfter(deadline: .now()){
//                                view = 1
//                            }
//                        } label: {
//                            Image(systemName: "chart.bar.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 35, height: 35)
//                                .foregroundColor(view == 1 ? .blue: .black)
//                        }
//                        Spacer()
//                        Button {
//                            view = 2
//                        } label: {
//                            Image(systemName: "calendar")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 35, height: 35)
//                                .foregroundColor(view == 2 ? .blue: .black)
//
//                        }
//                        Spacer()
//                        Button {
//                            view = 3
//                        } label: {
//                            Image(systemName: "largecircle.fill.circle")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 35, height: 35)
//                                .foregroundColor(view == 3 ? .blue: .black)
//                        }
//                    }
//                    .padding([.leading, .trailing], 70)
//                    .padding(.bottom, 10)
//                }
//
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
