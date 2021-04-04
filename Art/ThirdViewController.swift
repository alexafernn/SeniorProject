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
    

    lazy var internshipsController = storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
    lazy var eventsController = storyboard?.instantiateViewController(withIdentifier: "fifth_vc") as! FifthViewController
    lazy var profileController = storyboard?.instantiateViewController(withIdentifier: "sixth_vc") as! SixthViewController
    
//    override func viewDidAppear(_ animated: Bool) {
//
//            self.navigationController?.setNavigationBarHidden(false, animated: false)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // super.viewDidAppear(true)
        //setting the items we want to show in the menu
        let menu = MenuController(with: ["Home", "Internships", "Events", "Profile", "Logout"])
        menu.delegate = self //delegating to itself to come into the funciton below *
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide=true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
    }

    private func addChildControllers()
    {
        
        //adding child to child controller
        addChild(internshipsController)
        addChild(eventsController)
        addChild(profileController)
        
        //adding the childs view
        view.addSubview(internshipsController.view)
        view.addSubview(eventsController.view)
        view.addSubview(profileController.view)
        
        //setting view to be size of the whole screen
        internshipsController.view.frame = view.bounds
        eventsController.view.frame = view.bounds
        profileController.view.frame = view.bounds

        //you are a child under parent
        internshipsController.didMove(toParent: self)
        eventsController.didMove(toParent: self)
        profileController.didMove(toParent: self)
        
        internshipsController.view.isHidden = true
        eventsController.view.isHidden = true
        profileController.view.isHidden = true
    }
    
    @IBAction func didTapInternships()
    {
        self.internshipsController.view.isHidden = false
        self.eventsController.view.isHidden = true
        self.profileController.view.isHidden = true
    }
    
    
    @IBAction func didTapEvents()
    {
        self.internshipsController.view.isHidden = true
        self.eventsController.view.isHidden = false
        self.profileController.view.isHidden = true
    }

    @IBAction func didTapMenuButton()
    {
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) //*
    {
        //when you choose an item you want to get rid of th e side menu
        sideMenu?.dismiss(animated:true, completion:
        //based on whichever was chosen go to that screen
        { [weak self] in
           // self?.title = named
            if named == "Home"
            {
                print("pressed home")
                self?.internshipsController.view.isHidden = true
                self?.eventsController.view.isHidden = true
                self?.profileController.view.isHidden = true
            }
            else if named == "Internships"
            {
                print("pressed internships")
                self?.internshipsController.view.isHidden = false
                self?.eventsController.view.isHidden = true
                self?.profileController.view.isHidden = true
            }
            else if named == "Events"
            {
                print("pressed events")
                self?.internshipsController.view.isHidden = true
                self?.eventsController.view.isHidden = false
                self?.profileController.view.isHidden = true

            }
            else if named == "Profile"
            {
                print("pressed Profile")
                self?.internshipsController.view.isHidden = true
                self?.eventsController.view.isHidden = true
                self?.profileController.view.isHidden = false
                
            }
            else if named == "Logout"
            {
                let refreshAlert = UIAlertController(title: "Logout", message: "Are you sure you want to Logout?", preferredStyle: UIAlertController.Style.alert)

                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    self?.dismiss(animated: true)
                }))

                refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                }))

                self?.present(refreshAlert, animated: true, completion: nil)
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
