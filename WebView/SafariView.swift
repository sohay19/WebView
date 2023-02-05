//
//  SafariView.swift
//  WebView
//
//  Created by 소하 on 2023/02/02.
//

import SwiftUI
import SafariServices


class CustomSafariViewController : UIViewController {
    private var currentViewController:SFSafariViewController?
    
    func openUrl(_ url:URL) {
        let newViewController = SFSafariViewController(url: url)
        if let currentViewController = currentViewController {
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParent()
            self.currentViewController = nil
        }
        addChild(newViewController)
        newViewController.view.frame = view.frame
        view.addSubview(newViewController.view)
        currentViewController = newViewController
    }
}


struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> CustomSafariViewController {
        return CustomSafariViewController()
    }
    
    func updateUIViewController(_ uiViewController: CustomSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        uiViewController.openUrl(url)
    }
}
