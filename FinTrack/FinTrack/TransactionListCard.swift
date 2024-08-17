//
//  TransactionListCard.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import SwiftUI

struct TransactionListCard: View {
    @EnvironmentObject var transactionListVM:  TransactionListViewModel
    var body: some View {
        VStack{
            HStack{
//            MARK: Header Title
            Text("Recent Transactions")
                    .bold()
                
            Spacer()
            
//            //MARK: Header Link
//                NavigationLink {
//                    TransactionDetailView()
//                } label: {
//                    HStack(spacing: 4){
//                        Text("See all")
//                        Image(systemName: "chevron.right")
//                    }
//                    .foregroundColor(.blue)
//                    
//                }

            }
            .padding(.top)
            .padding(.bottom)
            
            ScrollView{
                //MARK: Recent Transation List
                //Prefic method allows to display the most recent
                ForEach(Array(transactionListVM.transactions.prefix(7).enumerated()), id: \.element) {index, transaction in
                    TransactionRow(transaction: transaction)
                    
                    Divider()
                        .opacity(index == 4 ? 0 : 1)
                }
            }
        }
        .padding()
        .foregroundColor(Color.text)
        .background(Color.background)
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(color: .black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 5)
    }
}

struct TransactionListCard_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
        
    }()
    
    static var previews: some View {
        TransactionListCard()
            .environmentObject(transactionListVM)
    }
}
