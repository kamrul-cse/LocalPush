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
        fireLocalPush()
    }
    
    func fireLocalPush() {
        // Step 1: Ask for permission
        let center = UNUserNotificationCenter.current()
                
        let uuidString = UUID().uuidString
        let url = Bundle.main.url(forResource: "donald_trump", withExtension: "png")
        let imageAttachment = try! UNNotificationAttachment(identifier: uuidString, url: url!, options: nil)
                
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Greetings from Donald Trump!"
        content.body = "I am ex-President of USA!"
        content.attachments = [imageAttachment]
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            print(error.debugDescription)
            // Check the error parameter and handle any errors
        }
    }
}

