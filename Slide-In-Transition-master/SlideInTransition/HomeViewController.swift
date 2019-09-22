//
//  ViewController.swift
//  SlideInTransition
//
//  Created by Gary Tokman on 1/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {
 // fields
    let transiton = SlideInTransition()
    var topView: UIView?
    
    @IBOutlet var actInd: UIActivityIndicatorView!
    let fhschedView = FHSchedWebKit()
    let calendarView = CalendarWebKit()
    let announcementView = announcmentWebKit()

    
   // View
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(calendarView)
        NSLayoutConstraint.activate([
                      calendarView.topAnchor.constraint(equalTo: view.topAnchor),
                      calendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                      calendarView.leftAnchor.constraint(equalTo: view.leftAnchor),
                      calendarView.rightAnchor.constraint(equalTo: view.rightAnchor)
                      ])
    }
    
    // handlers

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title

        topView?.removeFromSuperview()
        switch menuType {
        case .Home:
            self.view.addSubview(calendarView)

            NSLayoutConstraint.activate([
                calendarView.topAnchor.constraint(equalTo: view.topAnchor),
                calendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                calendarView.leftAnchor.constraint(equalTo: view.leftAnchor),
                calendarView.rightAnchor.constraint(equalTo: view.rightAnchor)
                ])
                
        case .profile:
            self.view.addSubview(fhschedView)

                 NSLayoutConstraint.activate([
                     fhschedView.topAnchor.constraint(equalTo: view.topAnchor),
                     fhschedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                     fhschedView.leftAnchor.constraint(equalTo: view.leftAnchor),
                     fhschedView.rightAnchor.constraint(equalTo: view.rightAnchor)
                     ])
        case .camera:
            self.view.addSubview(announcementView)

            NSLayoutConstraint.activate([
                announcementView.topAnchor.constraint(equalTo: view.topAnchor),
                announcementView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                announcementView.leftAnchor.constraint(equalTo: view.leftAnchor),
                announcementView.rightAnchor.constraint(equalTo: view.rightAnchor)
                ])
            
        default:
//            self.view.addSubview(calendarView)
//
//                       NSLayoutConstraint.activate([
//                           calendarView.topAnchor.constraint(equalTo: view.topAnchor),
//                           calendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                           calendarView.leftAnchor.constraint(equalTo: view.leftAnchor),
//                           calendarView.rightAnchor.constraint(equalTo: view.rightAnchor)
//                           ])
            break
        }
    }

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

