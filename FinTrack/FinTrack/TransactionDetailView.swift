//
//  TransactionDetailView.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import SwiftUI

struct TransactionDetailView: View {
    @EnvironmentObject var transactionListVM:  TransactionListViewModel
    var body: some View {
        VStack{
            Text("Recent Transactions")
                    .bold()
            
            //MARK: Recent Transation List
            //Prefic method allows to display the most recent
            ScrollView {
                ForEach(Array(transactionListVM.transactions.prefix(25).enumerated()), id: \.element) {index, transaction in
                    TransactionRow(transaction: transaction)
                    
                    Divider()
                        .opacity(index == 4 ? 0 : 1)
                        .colorInvert()
                }
            }
        }
        .padding()
        .colorInvert()
        .background(Color.background)
        
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
        
    }()
    
    static var previews: some View {
        TransactionDetailView()
            .environmentObject(transactionListVM)
    }
}
