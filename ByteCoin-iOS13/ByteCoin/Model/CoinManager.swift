//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "2E82B0AB-8536-477E-9B3A-5EAB3521F238"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString =  "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        //1. create a url
        if let url = URL(string: urlString) {
            //2. create a url session
            let session = URLSession(configuration: .default)
            //3. give task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                
                if let safeData = data {
                    if let rate = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", rate)
                        self.delegate?.didUpdateCoin(price:priceString, currency: currency )
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    

    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
