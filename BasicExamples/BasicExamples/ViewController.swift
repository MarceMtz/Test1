//
//  ViewController.swift
//  BasicExamples
//
//  Created by Desarrollo FVP on 16/08/17.
//  Copyright © 2017 Desarrollo FVP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passTxtField: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Hacemos la pedición
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        AlamofireProxy.sharedInstance.autentication(url: "http://elastic-poc-viajero.directrips.com", user: "onlyread", password: "onlyread12345", completion: { error in
            print("Se obtuvo ==>", error)
            if((error) != nil){
                print("Error")
            } else {
                self.performSegue(withIdentifier: "tablaResultados", sender: self)
            }
            /*
            var query: [String: Any] = ["id": "searchEntitiesTraveler"]
            var params: [String: Any]  = ["size" : 20, "from": 0]
            params["query_string"] = "Oaxaca"
            query["params"] = params
            print("Query a enviar ==>",query)
            AlamofireProxy.sharedInstance.getRequest(url: "http://elastic-poc-viajero.directrips.com/traveler/entity/_search/template", params: query , completion: { response in
                print("Se obtuvo getRequest ==>", response)
                
            })*/
        })
    }

}

