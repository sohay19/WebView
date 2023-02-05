//
//  WebView.swift
//  WebView
//
//  Created by 소하 on 2023/02/05.
//

import WebKit
import SwiftUI

class CustomWebViewContorller : UIViewController {
    var url:URL?
    var isRefrsh = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        let newView = WKWebView()
        newView.frame = view.frame
        view.addSubview(newView)
        guard let url = url else { return }
        newView.load(URLRequest(url: url))
    }
}

struct WebView : UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> CustomWebViewContorller {
        let newVC = CustomWebViewContorller()
        newVC.url = url
        return newVC
    }
    
    func updateUIViewController(_ uiViewController: CustomWebViewContorller, context: UIViewControllerRepresentableContext<WebView>) {
        uiViewController.url = url
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "http://www.naver.com")!)
    }
}
