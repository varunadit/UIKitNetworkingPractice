//
//  ViewControllerVM.swift
//  UIKitNetworkingPractice
//
//  Created by Varun Adit on 1/9/24.
//

import Foundation
import Combine

protocol HomeVCDataSourceDelegate: AnyObject {
    func onTableUpdated()
}

class ViewControllerVM {
    
    weak var homeDelegate: HomeVCDataSourceDelegate?
    
    private var cancellables: Set<AnyCancellable> = []
    
    //Markets(label: "BNBBTC", name: "Binance Coin", price: 312.57)
    
    var tableData: [Markets] = [] {
        didSet {
            self.homeDelegate?.onTableUpdated()
        }
    }
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
        UIKNetworkManager.shared.fetchResponse(type: MarketsResponseModel.self, urlString: "https://www.worldcoinindex.com/apiservice/ticker?key=gtXVEb3UXDXKwpJTPvJuSUFA8JaJmeqjivT&label=ethbtc-ltcbtc&fiat=btc")
            .receive(on: DispatchQueue.main)
            .sink { error in
                switch error {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] response in
                if let markets = response?.markets {
                    self?.tableData = markets
                    self?.homeDelegate?.onTableUpdated()
                }
            }
            .store(in: &cancellables)
    }
}
