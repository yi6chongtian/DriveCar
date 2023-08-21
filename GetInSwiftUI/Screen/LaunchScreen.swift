//
//  LaunchScreen.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/7/28.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isCheck = false
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("getin_bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("getin_text")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 215, height: 232).offset(x: 0, y: 120)
                    
                    Spacer()
                    
                    NavigationLink {
                        LoginScreen().navigationTitle("登录")
                    } label: {
                        Button {
                            print("立即上车")
                        } label: {
                            Image("rightnow_getin")
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                        .background(RoundedRectangle(cornerRadius:25).foregroundColor(.white))
                        .padding(.horizontal, 44)
                        .disabled(true)
                    }
                    
                    HStack {
                        Button {
                            isCheck.toggle()
                        } label: {
                            Image(isCheck ? "sync_check": "sync_uncheck")
                        }
                        Text("我已阅读并同意《GET IN 用户协议》和《GET IN 隐私政策》").foregroundColor(Color(UIColor(red: 0.82, green: 0.83, blue: 0.84, alpha: 1))).lineLimit(nil)
                    }.padding()
                }.padding(.bottom, 34)
            }
        }
        
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
