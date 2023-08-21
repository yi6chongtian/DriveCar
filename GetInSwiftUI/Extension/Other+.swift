//
//  Other+.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/8/3.
//

import Foundation
import SwiftUI

extension UIApplication {
    var key: UIWindow? {
        self.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?
            .windows
            .filter({$0.isKeyWindow})
            .first
    }
}
//扩展底层的UIView 以获取到TabBar属性
extension UIView {
    func allSubviews() -> [UIView] {
        var subs = self.subviews
        for subview in self.subviews {
            let rec = subview.allSubviews()
            subs.append(contentsOf: rec)
        }
        return subs
    }
}
//修改TabBar
struct TabBarModifier {
    static func showTabBar() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.backgroundColor = .systemGray5 //BUGS: 后台驻足时间够长，返回时TabBar无背景
                view.barTintColor = .systemBackground//BUGS: 后台驻足时间够长，返回时TabBar无背景
                view.isHidden = false //将TabBar隐藏
            }
        })
    }
    
    static func hideTabBar() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = true//显示 TabBar
            }
        })
    }
}
//使用 ViewModifier 显示TabBar
struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.showTabBar()
        }
    }
}
//同上 隐藏TabBar
struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.hideTabBar()
        }
    }
}
//方便调用
extension View {
    var showTabBar:some View {
        return self.modifier(ShowTabBar())
    }
    var hiddenTabBar:some View {
        return self.modifier(HiddenTabBar())
    }
}
