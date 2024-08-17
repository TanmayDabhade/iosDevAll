//
//  ExpenditureCardView.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/7/24.
//

import SwiftUI

struct DebitCardView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel

    var body: some View {
        VStack {
            Text("Total Spend")
                .font(.headline)
            Text("$\(transactionListVM.totalDebitAmount, specifier: "%.2f")")
                .font(.title)
        }
        
        .padding()
        .frame(width: 170, height: 170)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))

        .background(Color.background)
        .foregroundColor(.red)
    }
}

struct DebitCardView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()

    static var previews: some View {
        DebitCardView()
            .environmentObject(transactionListVM)
    }
}
