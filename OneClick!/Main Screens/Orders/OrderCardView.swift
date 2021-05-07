//
//  OrdersView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 9.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct OrderCardView: View {
    @ObservedObject var orderState = OrderViewModel()
    @State var cancelState = OrderCancel()
    var index: Int = 0
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(orderState.orders, id:\.self){ order in

                    VStack(alignment: .leading,spacing: 8) {
                        
                        HStack(alignment: .center,spacing: 130){
                            HStack{
                                Text("ID:" + String(order.id))
                                    .bold()
                                Text(order.status)
                                    // .background(Color.blue).opacity(0.3)
                                    .foregroundColor(.blue)
                            }
                            Text(order.price + "$")
                                .padding(.trailing ,16)
                        }
                        
                        VStack(alignment: .leading,spacing: 8){
                            HStack{
                                Image(systemName: "calendar").opacity(0.4)
                                Text(order.date)
                                
                            }
                            HStack{
                                Image(systemName: "person").opacity(0.4)
                                Text(String(order.people))
                            }
                        }
                        HStack{
                            Image("demo")
                                .resizable()
                                .frame(width: 72, height: 72)
                            VStack(alignment: .leading){
                                Text(String(order.placeId))
                                    .bold()
                                HStack(alignment: .center){
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                    Text("4.2").foregroundColor(Color.black)
                                        .font(.subheadline)
                                    Text("(95)").foregroundColor(Color.black.opacity(0.7))
                                        .font(.subheadline)
                                }
                            }
                        }.padding(.bottom)
                        Button(action: {
                            print("Cancel!")
                            self.cancelState.cancelOrder(id: String(order.id))
                            self.orderState.orders.remove(at: self.index) 
                        }) {
                            Text("Cancel")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 226, height: 48)
                                .background(Color.blue)
                                .cornerRadius(Constants.Styles.largeCornerRadius)
                        }.frame(maxWidth: .infinity)
                    }
                }.padding(.leading)
                
            }.onAppear{
                self.orderState.fetchOrderssData(){ (order) in
                    self.orderState.orders = order
                }
            }.navigationBarTitle("Reserved")
            
        }
    }
}
