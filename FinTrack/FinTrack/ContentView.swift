//
//  ContentView.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    let transaction = transactionPreviewData
    var body: some View {
        NavigationView(content: {
            ScrollView {
            VStack {
                VStack {
                    VStack(alignment: .leading, content: {
                        HStack{
                            DebitCardView()
                            Spacer()
                            CreditCardView()
                        }
                        .padding()
                        .background(Color.background)
                    })
                    .frame(maxHeight: .infinity)
                    .padding()
                    .background(Color.background)
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Overview")
                                .bold()
                                .padding()
                                .colorInvert()
                        
                        BarChartView(data: [
                                            SleepDataPoint(day: "Monday", hours: 7),
                                            SleepDataPoint(day: "Tuesday", hours: 6),
                                            SleepDataPoint(day: "Wednesday", hours: 8),
                                            SleepDataPoint(day: "Thursday", hours: 5),
                                            SleepDataPoint(day: "Friday", hours: 7),
                                            SleepDataPoint(day: "Saturday", hours: 9),
                                            SleepDataPoint(day: "Sunday", hours: 8)
                                        ])
                        .padding()
                        .colorInvert()
                        
                        
                        
                        
                    }
                    .padding()
                    .background(Color.background)
                    Spacer()
                    
                }
                .background(Color.background)
            }
            .background(Color.background)
            VStack{
                Spacer()
                ZStack{
                    TransactionListCard()
                        .frame(height: 500)
                    
                    VStack {
                        Spacer()
                        NavigationLink(destination: TransactionDetailView()) {
                                            Text("View All Transactions")
                                                .foregroundColor(.white)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                        }
                                        .padding(.horizontal, 15) // Adjust the horizontal padding here
                                        .padding(.bottom, 10) // Adjust the bottom padding if needed
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                }

                .background(Color.background)
                .padding()

    
               
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Overview")
            .background(Color.background)
            .frame(alignment: .leading)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .renderingMode(.original)
                }
            }
            .background(Color.background)
        }
            
            
        })
        .background(Color.background)
        .ignoresSafeArea()
    }
}
struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
        
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}
