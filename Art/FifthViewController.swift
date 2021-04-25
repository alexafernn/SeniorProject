//
//  FifthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

/*events view controller */
import UIKit

class FifthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
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
        arrangeTableView()
        
        /*
         AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default/*URLEncoding.default*/, headers:nil).responseJSON
         { response in
             
             switch response.result
             {
                 case .success(let value):
                 debugPrint("PRINTING DEBUG: ", response)
                 print(response)
                 
                 if let JSON = value as? [String: Any]
                 {
                    first_name = JSON["first_name"] as! String
                    last_name = JSON["last_name"] as! String
                    email = JSON["email"] as! String
                    graduation = JSON["graduation"] as! String
                    age = JSON["age"] as! Int
                    gender = JSON["gender"] as! String
                    attributes = JSON["attributes"] as! String
                    
                    let ageString = String(age)
                 
                    print(first_name)
                    print(last_name)
                    print(email)
                    print(graduation)
                    print(ageString)
                    print(gender)
                    print(attributes)
                     
                     self._firstname.text = first_name
                     self._lastname.text = last_name
                     self._email.text = email
                     self._graduationyear.text = graduation
                     self._gender.text = gender
                     self._learnaboutCodeArt.text = attributes
                     self._birthdate.text = ageString
                 }
                 case .failure(let error):
                     print("error is ", error)
             }
      
         }
     }
     
         
         
         */
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
            return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //setting cell info, we want the it to say event + the number event it is
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! NewCell
        cell.backgroundColor = UIColor.white
        cell.eventsLabel.text = "Event \(indexPath.row+1):"
        return cell
    }

    //height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    //selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
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
           label.text = "Event 1:"
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
            cellView.addSubview(eventsLabel)
            self.selectionStyle = .none
            
            NSLayoutConstraint.activate([
                cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
                cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
                cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            
            eventsLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
            eventsLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            eventsLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
            eventsLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
            
        }
        
    }
    
    
    
}
