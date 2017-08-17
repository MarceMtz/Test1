//
//  AlamofireProxy.swift
//  BasicExamples
//
//  Created by Desarrollo FVP on 16/08/17.
//  Copyright © 2017 Desarrollo FVP. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireProxy {
    static let sharedInstance = AlamofireProxy()
    var manager: Alamofire.SessionManager
    
    required init() {
        self.manager = Alamofire.SessionManager.default
    }
    
    public func autentication(url: String, user: String, password: String, completion: @escaping (NSError?) -> ()) {
        print("Iniciar AUTENTICACION")
        
        manager.request(url)
            .authenticate(user: user, password: password)
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    print("Validation Successful")
                    completion(nil)
                case .failure(let error):
                    print(error)
                    print("--------------")
                    let error1: NSError = error as NSError
                    print(error1.code)
                    print(error1.localizedDescription)
                    completion(error1)
                }
        }
    }
    
    func getRequest(url: String, params: [String: Any]?, completion: @escaping ([String: Any]?) -> ()){
        self.manager.request(url, method: .post, parameters: params!, encoding: JSONEncoding.default, headers: [:]).responseJSON { JSON in
            print(JSON.value)
            completion(JSON.value as! [String : Any])
        }

        /*self.manager.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON { JSON in
            print(JSON)
        }*/

    }


}
