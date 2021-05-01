//
//  FourthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import SideMenu
import UIKit
import Alamofire

var count = Int()
var company_arr = [String]()
var role_arr = [String]()
var description_arr = [String]()
var start_date_arr = [String]()
var end_date_arr = [String]()
var link_arr = [String]()
var cell_clicked = Int()


var table_count = 0
var test21 = 0

/*internships view controller*/
class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var id1 = Int()
    var arr = [Any]()

    var company_name = String()
    var role = String()
    
    var company_name2 = String()
    var role3 = String()
    
    //creating table view object with requirements
    let tableview: UITableView =
    {
        let table_view = UITableView()
        table_view.backgroundColor = UIColor.white
        table_view.separatorColor = UIColor.white
        table_view.translatesAutoresizingMaskIntoConstraints = false
        return table_view
    }()

    //whne view loads , show the table
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        var idString = String()
        idString = String(id)
        var authString = String()
        authString = String(auth)
       // print("in view did load ")
//        company_arr.append("place holder")
//        role_arr.append("place holder ")
        //trying to get amount of internships
        let url = URL(string: "http:codeart.cs.loyola.edu/internallinfo?id="+idString+"&auth"+authString)!
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:nil)
            
            .responseJSON { response in
                debugPrint("PRINTING DEBUG: ", response)
                print("response is " , response.response!.statusCode)
                switch response.result
                {
                    case .success(let value):
                        
                        print(response)
                        print("IN SUCCESS of internship info")
                        if let JSON = value as? [String: Any]
                        {
                            //getting array from json
                            self.arr = JSON["data"] as! [Any]
                            print("arr = " , self.arr)
                            
                            //getting count of internships
                            count = self.arr.count
                            print("count variable =", count)
                            print("count = ", self.arr.count) //COUNT OF AMOUNT OF INTERNSHIPS
                            
                            print("arr1 = " , self.arr[1])
                            var test = Int()
                            test = self.arr[1] as! Int + 1
                            print(test)
                            
                            var i = Int()
                            i = -1
                            
                            while i < count - 1
                            {
                                i = i + 1
                                print("IN WHILE LOOOP i =" )
                                print(i)
                                var id_value = self.arr[i] as!Int
                                print("id value is ")
                                print(id_value )
                                var id_value_to_string = String()
                                id_value_to_string = String(id_value)
                                let url1 = URL(string: "http://codeart.cs.loyola.edu/interninfo?id="+idString+"&auth"+authString+"&intern_id="+id_value_to_string)!
                                AF.request(url1, method: .get, parameters: nil, encoding: JSONEncoding.default/*URLEncoding.default*/, headers:nil).responseJSON
                                { response in
                                    
                                    switch response.result
                                    {
                                        case .success(let value):
                                        debugPrint("PRINTING DEBUG: ", response)
                                        print(response)
                                        print("INSIDE INTERN GET")
                                        if let JSON = value as? [String: Any]
                                        {
                                            role_arr.append(JSON["role"]as! String)
                                            company_arr.append(JSON["company"]as! String)
                                            description_arr.append(JSON["details"]as! String)
                                            start_date_arr.append(JSON["start_datetime"]as! String)
                                            end_date_arr.append(JSON["end_datetime"]as! String)
                                            link_arr.append(JSON["link"]as! String)
                                            
                                
                                            print("dumping the company arr in the if")
                                            dump(company_arr)
                                            print("dumping the role arr in the if ")
                                            dump(role_arr)
                                            test21 = test21 + 1
                                            print("in here test 21 = ", test21)
                                            print("dumping link arr")
                                            dump(link_arr)
                                            
                                            print("reaching arrange table view ")
//                                            print("test 21 = ")
//                                            print("count after test 21 = ")
                                            if(test21 == count)
                                            {
                                                print("inside the test 21 if ")
                                                self.arrangeTableView()
                                            }
                
                                        }
                                        case .failure(let error):
                                            print("error is ", error)
                                   }
                               
                            }
                               // print("reaching arrange table view ")
                               // self.arrangeTableView()
                                
                            
                        }
                    
//                            print("reaching arrange table view ")
//                            self.arrangeTableView()
                            
                  
                            
                }
               
                    case .failure(let error):
                        print("error is ", error)
             }
              
          
                
        }
 

    }
                
                
    
    
    
          
        
        
       
    
    
    //arranging the table view with constraints
    func arrangeTableView()
    {
        tableview.delegate = self
        tableview.dataSource = self
        //tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableview.register(NewCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate(
        [
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
     }
    
    //setting 10 number of cells in the table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            // want to change this so that it returns the number of internships that we have online and creates that number
            print("inside table view returning count of " , count )
            return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
      //  print("inside table view trying dump")
       // dump(company_arr)
       // dump(role_arr)
        //setting cell info, we want the it to say event + the number event it is
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! NewCell
        print("inxedPath=" , indexPath)
        cell.backgroundColor = UIColor.white
        cell.internshipsLabel.text = "Company: " + company_arr[indexPath.row] + "\nRole: " + role_arr[indexPath.row]
        print("table count = " , table_count)
//        cell.internshipsLabel.text = "Company: " + company_arr[table_count] + "\nRole: " + role_arr[table_count]
        table_count = table_count + 1
       // cell.internshipsLabel.text = "Internship \(indexPath.row+1):"
        return cell
    }

    //height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    //selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        cell_clicked = indexPath.row
        print("cell clicked was : " , cell_clicked)
        let destination = storyboard?.instantiateViewController(withIdentifier: "seventh_vc") as! SeventhViewController
        navigationController?.pushViewController(destination, animated: true)

    }
    
    
    //creating the cells making them purple and rounded
    class NewCell: UITableViewCell
    {
        let cellView: UIView =
        {
           let view = UIView()
           view.backgroundColor = UIColor(red: 160/255, green:157/255, blue:224/255, alpha: 1.0)
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
        }()
           
        let internshipsLabel: UILabel =
        {
           let label = UILabel()
//           label.text = "Internship 1:"
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 20)
           label.font = UIFont(name: "Gotham Rounded", size: 20.0)
//           label.sizeToFit()
           label.numberOfLines = 0
           label.lineBreakMode = .byTruncatingTail
//           label.adjustsFontSizeToFitWidth = true
//           label.minimumScaleFactor = 0.2
         
//           label.lineBreakMode = .byWordWrapping
         

        
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            arrangeView()
        }
        
        required init?(coder aDecoder: NSCoder)
        {
            fatalError("init(coder:) has not been implemented")
        }
        
        //addign constraints
        func arrangeView()
        {
            addSubview(cellView)
            cellView.addSubview(internshipsLabel)
            self.selectionStyle = .none
            
            NSLayoutConstraint.activate([
                cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
                cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
                cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            
            internshipsLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
            internshipsLabel.widthAnchor.constraint(equalToConstant: 370).isActive = true
            internshipsLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            internshipsLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
            
        }
        
    }
    


}
