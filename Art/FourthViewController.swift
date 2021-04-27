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
/*internships view controller*/
class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var id1 = Int()
    var arr = [Any]()
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
        print("in view did load ")
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
//                            var StringValue = String()
                            self.arr = JSON["data"] as! [Any]
                            
//                            StringValue = String(value)
                            print("arr = " , self.arr)
                            count = self.arr.count
                            print("count variable =", count)
                            print("count = ", self.arr.count) //COUNT OF AMOUNT OF INTERNSHIPS
                            print("arr1 = " , self.arr[1])
                            var test = Int()
                            test = self.arr[1] as! Int + 1
                            print(test)
                            self.arrangeTableView()
                        
                        }
               
                    case .failure(let error):
                        print("error is ", error)
             }
        }
       
        var test1 = String()
        test1 = "1"
        let url1 = URL(string: "http://codeart.cs.loyola.edu/interninfo?id="+idString+"&auth"+authString+"&intern_id"+test1)!
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
                   //first_name = JSON["first_name"] as! String
              
                    
                }
                case .failure(let error):
                    print("error is ", error)
            }
     
        }
        
        //arrangeTableView()
        
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
            return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //setting cell info, we want the it to say event + the number event it is
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! NewCell
        cell.backgroundColor = UIColor.white
        cell.internshipsLabel.text = "Internship \(indexPath.row+1):"
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
           label.text = "Internship 1:"
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 20)
           label.font = UIFont(name: "Gotham Rounded", size: 20.0)
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
            internshipsLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            internshipsLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            internshipsLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
            
        }
        
    }
    


}
