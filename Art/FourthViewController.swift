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
class FourthViewController: UIViewController/*, MenuControllerDelegate*/
{
//    private var sideMenu: SideMenuNavigationController?
    
        //private let internshipsController = FourthViewController()
        //private let homeController = ThirdViewController()
//    private let eventsController = FifthViewController()
//    private let profileController = SixthViewController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        let menu = MenuController(with: ["Home", "Internships", "Events", "Profile"])
//        menu.delegate = self //delegating to itself to come into the funciton below *
//        sideMenu = SideMenuNavigationController(rootViewController: menu)
//        sideMenu?.leftSide=true
//        SideMenuManager.default.leftMenuNavigationController = sideMenu
//        SideMenuManager.default.addPanGestureToPresent(toView: view)
//
//        addChildControllers()
    }
    
//    private func addChildControllers()
//    {
//        //adding child to child controller
//        //addChild(internshipsController)
//       // addChild(homeController)
//        addChild(profileController)
//        addChild(eventsController)
//
//        //adding the childs view
//        //view.addSubview(internshipsController.view)
//       // view.addSubview(homeController.view)
//        view.addSubview(profileController.view)
//        view.addSubview(eventsController.view)
//
//        //setting view to be size of the whole screen
//       // internshipsController.view.frame = view.bounds
//       // homeController.view.frame = view.bounds
//        profileController.view.frame = view.bounds
//        eventsController.view.frame = view.bounds
//
//        //you are a child under parent
//       // internshipsController.didMove(toParent: self)
//       // homeController.didMove(toParent: self)
//        profileController.didMove(toParent: self)
//        eventsController.didMove(toParent: self)
//
//        //internshipsController.view.isHidden = true
//        //homeController.view.isHidden = true
//        profileController.view.isHidden = true
//        eventsController.view.isHidden = true
//    }
    
//    @IBAction func didTapMenuButton()
//    {
//        present(sideMenu!, animated: true)
//    }
//
//    func didSelectMenuItem(named: String) //*
//    {
//        //when you choose an item you want to get rid of the side menu
//        sideMenu?.dismiss(animated:true, completion:
//        //based on whichever was chosen go to that screen
//        { [weak self] in
//            if named == "Home"
//            {
//                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "third_vc") as! ThirdViewController
//                self?.present(vc,animated: true)
////                self?.internshipsController.view.isHidden = true
////                self?.eventsController.view.isHidden = true
//            }
//            else if named == "Internships"
//            {
//                print("pressed internships")
//                //self?.homeController.view.isHidden = true
//               // self?.eventsController.view.isHidden = true
//                    //self?.profileController.view.isHidden = true
////                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "fourth_vc") as! FourthViewController
////                self?.present(vc,animated: true)
////                self?.internshipsController.view.isHidden = false
////                self?.eventsController.view.isHidden = true
//            }
//            else if named == "Events"
//            {
//                print("pressed events")
//                let vc2 = self?.storyboard?.instantiateViewController(withIdentifier: "fifth_vc") as! FifthViewController
//                self?.present(vc2,animated: true)
////                self?.internshipsController.view.isHidden = true
////                self?.eventsController.view.isHidden = false
//
//            }
//            else if named == "Profile"
//            {
//                print("pressed Profile")
//                let vc3 = self?.storyboard?.instantiateViewController(withIdentifier: "sixth_vc") as! SixthViewController
//                self?.present(vc3,animated: true)
////                self?.navigationController?.popViewController(animated: true)
//                //come back to
//            }
//        })
//
//    }
//}

}
