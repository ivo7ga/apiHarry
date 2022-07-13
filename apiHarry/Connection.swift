//
//  Connection.swift
//  apiHarry
//
//  Created by Iván González on 9/3/22.
//

import UIKit

class Connection {
    let baseURLString = "https://fedeperin-harry-potter-api.herokuapp.com/"
    
    func getPokemon(withId id: Int, completion: @escaping(_ potter:Potter?) -> Void){
        guard let url = URL(string: "\(baseURLString)personajes/\(id)")else{
            completion(nil)
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error == nil, let data = data{
                let potter = Potter(withJSONData: data)
                completion(potter)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func getSprite(withURLString urlString:String, completion: @escaping(_ image:UIImage?) -> Void){
        guard let url = URL(string:urlString)else {
            completion(nil)
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error == nil, let data = data{
                let image = UIImage(data: data)
                completion(image)
            }else {
                completion(nil)
            }
        }
        task.resume()
    }
}
