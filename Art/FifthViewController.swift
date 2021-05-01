//
//  FifthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

/*events view controller */
import UIKit
import Alamofire

var event_count = Int()
var event_name_arr = [String]()
var event_organizers_arr = [String]()
var event_location_arr = [String]()
var event_date_arr = [String]()
var event_description_arr = [String]()
var event_cost_arr = [String]()
var event_link_arr = [String]()
var event_cell_clicked = Int()

var event_table_count = 0
var create_table_condition = 0

class FifthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var eventArr = [Any]()
    //creating table view object with requirements
    let tableview: UITableView =
    {
        let table_view = UITableView()
        table_view.backgroundColor = UIColor.white
        table_view.separatorColor = UIColor.white
        table_view.translatesAutoresizingMaskIntoConstraints = false
        return table_view
    }()
    

    //when the view loads should the view and arranze the tables
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var eventIdString = String()
        eventIdString = String(id)
        var eventAuthString = String()
        eventAuthString = String(auth)
        
        create_table_condition = 0
        event_count = 0
        event_name_arr.removeAll()
        event_organizers_arr.removeAll()
        event_location_arr.removeAll()
        event_date_arr.removeAll()
        event_description_arr.removeAll()
        event_cost_arr.removeAll()
        event_link_arr.removeAll() 
        
        
        let url = URL(string: "http:codeart.cs.loyola.edu/eventallinfo?id="+eventIdString+"&auth"+eventAuthString)!
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:nil)
        .responseJSON
        { response in
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
                         self.eventArr = JSON["data"] as! [Any]
                         print("eventArr = " , self.eventArr)
                         
                         //getting count of events
                         event_count = self.eventArr.count
                         print("count variable =", event_count)
                         
//                         var test = Int()
//                         test = self.eventArr[1] as! Int + 1
//                         print(test)
                        
                        var i = Int()
                        i = -1
                                              
                        while i < event_count - 1
                        {
                              i = i + 1
                              //print("IN WHILE LOOOP i =" )
                              //print(i)
                              var id_value = self.eventArr[i] as!Int
                             // print("id value is ")
                             // print(id_value )
                              var id_value_to_string = String()
                              id_value_to_string = String(id_value)
                              let url1 = URL(string: "http://codeart.cs.loyola.edu/eventinfo?id="+eventIdString+"&auth"+eventAuthString+"&event_id="+id_value_to_string)!
                              AF.request(url1, method: .get, parameters: nil, encoding: JSONEncoding.default/*URLEncoding.default*/, headers:nil).responseJSON
                              { response in
                                  
                                  switch response.result
                                  {
                                      case .success(let value):
                                      debugPrint("PRINTING DEBUG: ", response)
                                      print(response)
//                                      print("INSIDE INTERN GET")
                                      if let JSON = value as? [String: Any]
                                      {
                                        
                                            
                                          event_name_arr.append(JSON["event_name"]as! String)
                                          event_organizers_arr.append(JSON["organizers"]as! String)
                                          event_location_arr.append(JSON["location"]as! String)
                                          event_date_arr.append(JSON["start_datetime"]as! String)
                                          event_description_arr.append(JSON["details"]as! String)
                                          event_cost_arr.append(JSON["cost"]as! String)
                                          event_link_arr.append(JSON["link"]as! String)
                                          
                              
                                          create_table_condition = create_table_condition + 1
                                          print("dumping the event arr in the if")
                                          dump(event_name_arr)
//                                          print("dumping the role arr in the if ")
//                                          dump(role_arr)
//                                          test21 = test21 + 1
//                                          print("in here test 21 = ", test21)
//                                          print("dumping link arr")
//                                          dump(link_arr)
                                          
                                          print("reaching arrange table view ")
    //                                            print("test 21 = ")
    //                                            print("count after test 21 = ")
                                          if(create_table_condition == event_count)
                                          {
//                                              print("inside the test 21 if ")
                                              print("inside create table condition ")
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

                        
                        
                        
                    }
                case .failure(let error):
                    print("error is ", error)
             }
         }
            //    arrangeTableView()
       
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
            // want to change this so that it returns the number of events that we have online and creates that number
          //  return 10
        return event_count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //setting cell info, we want the it to say event + the number event it is
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! NewCell
        cell.backgroundColor = UIColor.white
        cell.eventsLabel.text = "Event: " + event_name_arr[indexPath.row] + "\nOrganizers: " + event_organizers_arr[indexPath.row]
       // cell.eventsLabel.text = "Event Name: " + event_name_arr[event_table_count] + "\nOrganizers: " + event_organizers_arr[event_table_count]
        event_table_count = event_table_count + 1
        return cell
    }

    //height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    //selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        event_cell_clicked = indexPath.row
        let destination = storyboard?.instantiateViewController(withIdentifier: "eighth_vc") as! EighthViewController
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
           
        let eventsLabel: UILabel =
        {
           let label = UILabel()
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 20)
           label.font = UIFont(name: "Gotham Rounded", size: 20.0)
           label.sizeToFit()
           label.numberOfLines = 0
           label.adjustsFontSizeToFitWidth = true
           label.translatesAutoresizingMaskIntoConstraints = false
           label.lineBreakMode = .byTruncatingTail
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
            cellView.addSubview(eventsLabel)
            self.selectionStyle = .none
            
            NSLayoutConstraint.activate([
                cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
                cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
                cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            
            eventsLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
            eventsLabel.widthAnchor.constraint(equalToConstant: 370).isActive = true
            eventsLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            eventsLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
            
        }
        
    }
    
    
    
}
