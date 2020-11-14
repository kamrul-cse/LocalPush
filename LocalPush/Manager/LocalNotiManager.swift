//
//  LocalNotiManager.swift
//  LocalPush
//
//  Created by Md. Kamrul Hasan on 13/11/20.
//

import UserNotifications

class LocalNotiManager {
    class func schedule(title: String?, body: String?, image: String? = nil, bundle: Bundle? = nil, at date: Date = Date().addingTimeInterval(1)) {
        guard let title = title, let body = body else { return }
        let center = UNUserNotificationCenter.current()
                
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        if let attachment = getAttachemnt(image: image) {
            content.attachments = [attachment]
        }
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            print(error.debugDescription)
        }
    }
    
    class func getAttachemnt(image: String?, bundle: Bundle = Bundle.main) -> UNNotificationAttachment? {
        guard let image = image, let url = bundle.url(forResource: image, withExtension: "png") else { return nil }
        return try? UNNotificationAttachment(identifier: UUID().uuidString, url: url, options: nil)
    }
}
