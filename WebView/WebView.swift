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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 웹뷰 추가
        let newView = WKWebView()
        newView.frame = view.frame
        view.addSubview(newView)
        // URL 로드
        guard let url = url else { return }
        newView.load(URLRequest(url: url))
    }
}

struct WebView : UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> CustomWebViewContorller {
        return CustomWebViewContorller()
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
