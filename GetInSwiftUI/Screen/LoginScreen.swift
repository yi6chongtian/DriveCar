//
//  LoginScreen.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/7/28.
//

import SwiftUI

struct LoginScreen: View {
    @State private var phone = ""
    @State private var verifyCode = ""
    var body: some View {
            VStack(alignment: .leading) {
                                
                Text("注册/登录").setFontAndColor(size: 24, weight: .medium, txtColor: .black)
                    .padding(.top, 50)
                Text("未注册手机号，登录时将自动完成注册").setFontAndColor(size: 14, txtColor: Color.Color999999)
                
                phoneView.padding(.top, 40)
                
                verifyCodeView.padding(.top, 34)
                
//                NavigationLink {
//                    WeichangScreen()
//                } label: {
                    Button {
                        let window = UIApplication
                                    .shared
                                    .connectedScenes
                                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                    .first { $0.isKeyWindow }

                                window?.rootViewController = UIHostingController(rootView: HomeScreen())
                                window?.makeKeyAndVisible()
                    } label: {
                        Text("登录").setFontAndColor(size: 16, txtColor: .white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(RoundedRectangle(cornerRadius: 4).foregroundColor(Color.fromHexString(hexString: "#151B29")))
                            
                    }.padding(.top, 32)
//                }

                
                
                Spacer()
                
            }.padding().navigationTitle("登录")
    }
}

extension LoginScreen {
    var phoneView: some View {
        VStack {
            HStack {
                Label("+86", image: "arrow_down_black")
                TextField("手机号码", text: $phone).font(Font.system(size: 16)).foregroundColor(.black)
            }
            Rectangle().frame(maxWidth:.infinity, minHeight: 0.5, maxHeight: 0.5).foregroundColor(Color.fromHexString(hexString: "#EDEDED"))
        }
    }
    
    var verifyCodeView: some View {
        VStack {
            HStack {
                TextField("输入6位验证码", text: $verifyCode).font(Font.system(size: 16)).foregroundColor(.black)
                Button {
                    
                } label: {
                    Text("获取验证码").setFontAndColor(size: 16, txtColor: .Color333333)
                }

            }
            Rectangle().frame(height: 0.5).foregroundColor(Color.fromHexString(hexString: "#EDEDED"))
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
