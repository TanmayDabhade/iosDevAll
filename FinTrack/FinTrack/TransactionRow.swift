//
//  TransactionRow.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {

        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 8){
                Text(transaction.merchant)
                    .font(.subheadline)
                    .lineLimit(1)
                    .bold()
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(2.7)
                    .lineLimit(1)
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .opacity(2.7)
            }
            Spacer()
            
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.text: .primary)
        
//
            
        }


    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
