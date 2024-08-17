//
//  CreditCardView.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/7/24.
//

import SwiftUI

struct CreditCardView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel

    var body: some View {
        VStack {
            Text("Total Received")
                .font(.headline)
            Text("$\(transactionListVM.totalCreditAmount, specifier: "%.2f")")
                .font(.title)
        }
        .padding()
        .frame(width: 170, height: 170)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        .background(Color.background)
        .foregroundColor(.green)
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()

    static var previews: some View {
        CreditCardView()
            .environmentObject(transactionListVM)
    }
}
