//
//  HomeScreen.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/8/2.
//

import SwiftUI

struct HomeScreen: View {
    @State var selectIndex = 0
    var body: some View {
        TabView(selection: $selectIndex) {
            NavigationView {
                CommunityScreen()
            }.tabItem {
                Label("社区", image: "tab_community_normal")
            }.navigationViewStyle(StackNavigationViewStyle())
            
            NavigationView {
                FoundScreen()
            }.tabItem {
                Label("发现", image: "tab_find_normal")
            }.navigationViewStyle(.stack)
            
            NavigationView {
                MessageScreen()
            }.tabItem {
                Label("消息", image: "tab_message_normal")
            }.navigationViewStyle(.stack)
            
            NavigationView {
                MineScreen()
            }.tabItem {
                Label("我的", image: "tab_mine_normal")
            }.navigationViewStyle(.stack)
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
