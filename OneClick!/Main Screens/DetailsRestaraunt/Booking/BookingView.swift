//
//  BookingView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 8.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct BookingView: View {
    
    @State var timeManager = BookingManager()
    @State var sendingOrder = ReserveManager()
    @State var numberOfItems: Int = 0
    @State var time: Double = 0.0
    var id:String
    @Environment(\.presentationMode) var presentationMode
    @Binding var showsecondView: Bool
    @State var date = Date()
    @State private var showPicker: Bool = false
    @State private var selectedDateText: String = "Date"
    @State private var selectedTime: String = "Time"
    private var selectedDate: Binding<Date> {
        Binding<Date>(get: { self.date}, set : {
            self.date = $0
            self.setDateString()
        })
    }
    private func setDateString() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.selectedDateText = formatter.string(from: self.date)
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing:18){
                    
                    VStack(alignment: .leading,spacing:18){
                        Text("When do you want to visit this place?")
                        
                            
                            HStack(spacing:112) {
                                Text("Reservation:")
                                    .frame(alignment: .leading)
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                                    Text(selectedDateText)
                                        .opacity(0.5)
                                        .onAppear() {
                                            self.setDateString()
                                        }
                                    Image(systemName: "chevron.right")
                                }
                                
                                .onTapGesture {
                                    self.showPicker.toggle()
                                }
                            }
                            if showPicker {
                                DatePicker("", selection: selectedDate,
                                           displayedComponents: .date)
                                    .animation(.easeIn(duration: 1.0))
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .labelsHidden()
                            }
                        
                    }
                    Divider()
                    VStack(alignment: .leading,spacing:4){
                        HStack{
                            
                            Stepper("How many people? \(Text(String(numberOfItems)))", onIncrement: {
                                timeManager.getTimeData(id: id)
                                numberOfItems += 1
                            }, onDecrement: {
                                timeManager.getTimeData(id: id)
                                numberOfItems -= 1
                            })
                        }
                    }
                    Divider()
                    VStack(alignment: .leading,spacing:4){
                        HStack{
                            
                            Stepper("Time for staying: \(Text(String(time)))", onIncrement: {
                                timeManager.getTimeData(id: id)
                                time += 0.5
                            }, onDecrement: {
                                timeManager.getTimeData(id: id)
                                time -= 0.5
                            })
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Time")
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(timeManager.time , id:\.self){ time in
                                    Text(time)
                                        .frame(width: 109, height: 48 ,alignment: .center)
                                        .foregroundColor(self.selectedTime == time ? Color.white : Color.black.opacity(0.6))
                                        .background(self.selectedTime == time ? Color.blue : Color.gray.opacity(0.1))
                                        .cornerRadius(50)
                                        .onTapGesture {
                                            self.selectedTime = time
                                                
                                        }
                                        
                                    
                                }
                                .onAppear {
                                    self.timeManager.getTimeData(id: id)
                                }
                            }
                        }
                    }
                    
                    .navigationBarItems(trailing:
                                            HStack {
                                                Button(action: {
                                                    self.presentationMode.wrappedValue.dismiss()
                                                    print("go back")
                                                }) {
                                                    Image(systemName: "pencil.slash")
                                                        .font(.largeTitle)
                                                }.foregroundColor(.black)
                                            })
                  
                    VStack(alignment: .center){
                        Button(action: {
                            print("ok bro")
                            sendingOrder.sendingOrder(id: id ,date:selectedDateText  ,people: String(numberOfItems),staying: String(time),time: selectedTime)
                            print(id)
                        }) {
                            Text("Continue")
                                .font(.headline)
                                .frame(width: 226, height: 48)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 226, height: 48 ,alignment: .center)
                                .background(Color.blue)
                                .cornerRadius(Constants.Styles.largeCornerRadius)
                            
                        }.frame(maxWidth: .infinity)
                    }
                    .navigationBarTitle("Book a table")
                    Spacer()
                }
            }
            .padding()
        }
    }
}


//struct BookingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookingView(id: "1")
//    }
//}
