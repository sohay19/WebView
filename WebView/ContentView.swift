//
//  ContentView.swift
//  WebView
//
//  Created by 소하 on 2023/02/02.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    @State private var isShow = false
    @State private var targetUrl:URL?
    
    var body: some View {
        NavigationStack {
            Button {
                setUrl(.Naver)
            } label: {
                Text("네이버 열기")
            }
            .navigationDestination(isPresented: $isShow) {
                if let targetUrl = targetUrl {
                    SafariView(url: targetUrl)
                }
            }
            .padding()
            
            Button {
                setUrl(.Google)
            } label: {
                Text("구글 열기")
            }
            .navigationDestination(isPresented: $isShow) {
                if let targetUrl = targetUrl {
                    SafariView(url: targetUrl)
                }
            }
            .padding()
            
            Button {
                setUrl(.Tistory)
            } label: {
                Text("티스토리 열기")
            }
            .navigationDestination(isPresented: $isShow) {
                if let targetUrl = targetUrl {
                    SafariView(url: targetUrl)
                }
            }
            .padding()
        }
    }
    
    // 열릴 페이지 설정
    func setUrl(_ pageType:Page) {
        guard let url = URL(string: pageType.rawValue) else { return }
        targetUrl = url
        isShow.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
