//
//  NetworkManager.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import Foundation
import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    let cache         = NSCache<NSString,UIImage>()
    
    private init(){}
    
    func getProducts(completion:@escaping(Result<Products,AppError>)->Void){
        let urlString = "https://fakestoreapi.com/products"
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse,
            response.statusCode == 200
            else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let products = try decoder.decode(Products.self, from: data)
                completion(.success(products))
            } catch  {
                completion(.failure(.errorDecoding))
            }
         }
        task.resume()
        
    }
    
    func downloadImage(from urlString:String,completion:@escaping(UIImage?)->Void){
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else{return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data  = data,
                  let image = UIImage(data: data) else{completion(nil)
                  return}
            self.cache.setObject(image, forKey: cacheKey)
               completion(image)
           
        }
        task.resume()
    }
    
    
}
