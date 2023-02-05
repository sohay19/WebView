//
//  ContentView.swift
//  WebView
//
//  Created by 소하 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    // Safari 열림 체크
    @State private var isSafariShow = false
    // WebView 열림 체크
    @State private var isWebShow = false
    // 열릴 URL
    @State private var targetUrl:URL?
    
    var body: some View {
        NavigationStack {
            // Safari
            VStack {
                Text("Safari로 열기")
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                
                Button {
                    setSafariUrl(.Naver)
                } label: {
                    Text("네이버 열기")
                }
                .navigationDestination(isPresented: $isSafariShow) {
                    if let targetUrl = targetUrl {
                        SafariView(url: targetUrl)
                    }
                }
                .padding()
                
                Button {
                    setSafariUrl(.Google)
                } label: {
                    Text("구글 열기")
                }
                .navigationDestination(isPresented: $isSafariShow) {
                    if let targetUrl = targetUrl {
                        SafariView(url: targetUrl)
                    }
                }
                .padding()
                
                Button {
                    setSafariUrl(.Tistory)
                } label: {
                    Text("티스토리 열기")
                }
                .navigationDestination(isPresented: $isSafariShow) {
                    if let targetUrl = targetUrl {
                        SafariView(url: targetUrl)
                    }
                }
                .padding()
            }
            .padding(60)
            
            //WebView
            VStack {
                Text("WebView로 열기")
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                
                Button {
                    setWebUrl(.Naver)
                } label: {
                    Text("네이버 열기")
                }
                .navigationDestination(isPresented: $isWebShow) {
                    if let targetUrl = targetUrl {
                        WebView(url: targetUrl)
                    }
                }
                .padding()
                
                Button {
                    setWebUrl(.Google)
                } label: {
                    Text("구글 열기")
                }
                .navigationDestination(isPresented: $isWebShow) {
                    if let targetUrl = targetUrl {
                        WebView(url: targetUrl)
                    }
                }
                .padding()
                
                Button {
                    setWebUrl(.Tistory)
                } label: {
                    Text("티스토리 열기")
                }
                .navigationDestination(isPresented: $isWebShow) {
                    if let targetUrl = targetUrl {
                        WebView(url: targetUrl)
                    }
                }
                .padding()
            }
        }
    }
    
    // Safari로 열릴 페이지 설정
    func setSafariUrl(_ pageType:Page) {
        guard let url = URL(string: pageType.rawValue) else { return }
        targetUrl = url
        isSafariShow.toggle()
    }
    
    // Web으로 열릴 페이지 설정
    func setWebUrl(_ pageType:Page) {
        guard let url = URL(string: pageType.rawValue) else { return }
        targetUrl = url
        isWebShow.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
