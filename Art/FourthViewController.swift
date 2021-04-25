//
//  FourthViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//

import SideMenu
import UIKit

/*internships view controller*/
class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
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

    //whne view loads , show the table
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        arrangeTableView()
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
            return 10
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
