//
//  ResultsTableViewController.swift
//  BasicExamples
//
//  Created by Desarrollo FVP on 16/08/17.
//  Copyright © 2017 Desarrollo FVP. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    var entidades: [[String: Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtenemos la cantidad de elementos
        self.getElements()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getElements(){
        var query: [String: Any] = ["id": "searchEntitiesTraveler"]
        var params: [String: Any]  = ["size" : 20, "from": 0]
        params["query_string"] = "Oaxaca"
        query["params"] = params
        print("Query a enviar ==>",query)
        AlamofireProxy.sharedInstance.getRequest(url: "http://elastic-poc-viajero.directrips.com/traveler/entity/_search/template", params: query , completion: { response in
            print("Se obtuvo getRequest ==>", response)
            if(response != nil){
                
                for (key, value) in response! {
                    // access all key / value pairs in dictionary
                    if(key == "hits"){
                        //let array = value as! [Any]
                        if let array = value as? [String: Any] {
                            for (key1, value1) in array{
                                print("KEY 1 =>", key1)
                                if(key1 == "hits"){
                                    if let array2 = value1 as? [Any] {
                                        print("Se encontro arreglo de resultados")
                                        for k in array2 {
                                            print("K ==>", k)
                                            let kk = k as! [String: Any]
                                            self.entidades.append(kk)
                                        }
                                        print(array2.count)
                                    }
                                    break
                                }
                            }
                            /*if let results = array["hits"] as? [String: Any]{
                                self.entidades = results
                            }*/
                        }
                        break
                    }
                }
                
                print("Valor que se encontro ==>", self.entidades.count)
                
                //Procesamos la respuesta
                /*if let firstHits = response!["hits"] as? [String: Any] {
                    // access nested dictionary values by key
                    if let resultsJSON = firstHits["hits"] as? [String: Any] {
                        // access nested dictionary values by key
                        for elements in resultsJSON{
                            print("Elemento ==>", elements)
                        }
                    }
                }*/
            }
        })
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
