//
//  ThirdViewController.swift
//  Art
//
//  Created by Alexa Fernandez on 4/1/21.
//  Copyright © 2021 Alexa. All rights reserved.
//
import SideMenu
import UIKit

/*check out view controller*/
class ThirdViewController: UIViewController, MenuControllerDelegate
{
    private var sideMenu: SideMenuNavigationController?
    
    private let settingsController = SettingsViewController()
    private let infoController = InfoViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the items we want to show in the menu
        let menu = MenuController(with: ["Home", "Internships", "Events", "Profile"])
        menu.delegate = self //delegating to itself to come into the funciton below *
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide=true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
    }

    private func addChildControllers()
    {
        addChild(settingsController)
        addChild(infoController)
        view.addSubview(settingsController.view)
        view.addSubview(infoController)
    }
    
    @IBAction func didTapInternships()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
        present(vc,animated: true)
    }
    
    
    @IBAction func didTapEvents()
    {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "fifth_vc") as! FifthViewController
        present(vc2,animated: true)
    }

    @IBAction func didTapMenuButton()
    {
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) //*
    {
        //when you choose an item you want to get rid of the side menu
        sideMenu?.dismiss(animated:true, completion:
        //based on whichever was chosen go to that screen
        {
            if named == "Home"
            {
                
            }
            else if named == "Internships"
            {
                
            }
            else if named == "Events"
            {
                
            }
            else if named == "Profile"
            {
                
            }
        })
        
    }
    
}

protocol MenuControllerDelegate
{
    func didSelectMenuItem(named: String)
}
class MenuController: UITableViewController
{
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [String]
    
    init(with menuItems: [String])
    {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder:NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    //table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.font = UIFont(name: "GothamRounded-Bold", size:20)
        cell.textLabel?.textColor = UIColor(red: 47/255, green:48/255, blue:133/255, alpha: 1.0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
    
}
