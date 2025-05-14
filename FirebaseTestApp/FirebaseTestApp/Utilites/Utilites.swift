//
//  Utilites.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 07.04.2025.
//

import Foundation
import UIKit

final class Utilities {
    
    static let shared = Utilities()
    private init () {}
    
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController

        if let nav = controller as? UINavigationController {
            return topViewController(controller: nav.visibleViewController)
        }

        if let tab = controller as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(controller: selected)
            }
        }

        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }

        return controller
    }

}
