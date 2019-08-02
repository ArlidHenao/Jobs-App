//
//  LocalNotificationsController.swift
//  Profesiones App
//
//  Created by Arlid Henao Rueda on 7/31/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationsController {
    init() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, . badge]) { (success, error) in
            if success {
                self.addNotifications()
            }
        }
    }
    
    func addNotifications(){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "¿ Necesitas a un Profesional el día de hoy ?"
        content.body = "Recuerda ingresar a la App para encontrar el Profesional que necesitas"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: "seconds", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            guard let error = error else {return}
            print(error.localizedDescription)
        }
    }
    
}
