//
//  ViewController.swift
//  LocalPush
//
//  Created by Md. Kamrul Hasan on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fireNotiTapped(_ sender: Any) {
        print("clicked me")
        
        //Example 1
        LocalNotiManager.schedule(title: "Title", body: "Body")
        
        //Example 2
        LocalNotiManager.schedule(title: "Title", body: "Body", image: "donald_trump")
        
        //Example 3
        LocalNotiManager.schedule(title: "Title", body: "Body", image: "donald_trump", at: Date().addingTimeInterval(10))
    }
}

