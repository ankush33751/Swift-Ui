//
//  Store.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 01/06/21.
//

import Combine
import Foundation

class Store: ObservableObject {
    @Published var posts:[DataModel]=[]
    init(){
        Api().makeApiCalls(completion: {
            self.posts=$0
        })
    }
}


private class Api{
    fileprivate func makeApiCalls(completion:@escaping ([DataModel])->Void){
    guard let url=URL(string: "https://jsonplaceholder.typicode.com/posts") else{
        return
    }
    URLSession.shared.dataTask(with: url){
        (data,_,error) in
        guard let data=data else{return}
        let product = try! JSONDecoder().decode([DataModel].self, from: data)
        DispatchQueue.main.async {
            completion(product)
        }

    }.resume()
    }
}
