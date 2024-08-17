//
//  TransactionListviewModel.swift
//  FinTrack
//
//  Created by Tanmay Avinash Dabhade on 8/6/24.
//

import Foundation
import Combine

//Observable Object is the part of the combined framework that turns any object into a publisher and will notify its subscribers about its state changes so that they can change their views
final class TransactionListViewModel: ObservableObject {
    //Type is an array of transaction initialised to an empty array. Property wrapper @Published sends notification to all subscribers when state changes
    @Published var transactions: [Transaction] = []
    
    var totalDebitAmount: Double {
            return transactions
                .filter { $0.type == TransactionType.debit.rawValue }
                .reduce(0) { $0 + $1.amount }
        }
    
    var totalCreditAmount: Double {
            return transactions
                .filter { $0.type == TransactionType.credit.rawValue }
                .reduce(0) { $0 + $1.amount }
        }
    
    private var cancellables = Set<AnyCancellable>()
    //Above initialisation is set of any cancellables
    
    init(){
        getTransactions()
        
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response)
                    //dump is like print but in a good reading format. better for logging objects.
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
        //Since sink confirms with the cancellable protocol, meaning it supports cancellation and returns any cancellable. The final step is to store the cancellable reference to the subscriber to the set of cancellables.
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error Fetching Transactions", error.localizedDescription)
                case .finished:
                    print("Finished Fetching Transactions")
                    
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
            }
            .store(in: &cancellables) // When that reference gets reallocated it will cancel the subscription thus free up resources.

    }
}

