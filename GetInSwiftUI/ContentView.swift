//
//  ContentView.swift
//  GetInSwiftUI
//
//  Created by bill on 2023/7/28.
//

//import SwiftUI

//struct ContentView: View {
//    //定义状态
//    @State private var circleColorChanged = false
//    @State private var heartColorChanged = false
//    @State private var heartSizeChanged = false
//
//    @GestureState private var longPressTap = false
//
//    @GestureState private var dragOffset = CGSize.zero
//
//    @State private var position = CGSize.zero
//    var body: some View {
////        LaunchScreen()
////        LoginScreen()
//        //绘制
//        ZStack {
//            Circle()
//                .frame(width: 200, height: 200)
//                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
//            Image(systemName: "heart.fill")
//                .foregroundColor(heartColorChanged ? .red : .white)
//                .font(.system(size: 80))
//                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
//                .opacity(longPressTap ? 0.4 : 1.0)
//            }.gesture(
////                //长按手势
////                LongPressGesture(minimumDuration: 2.0)
//////                    .updating($longPressTap, body: { currentState, state, transaction in
//////                        print("udpate...")
//////                        state = currentState
//////                    })
////                    .onEnded({ _ in
////                        self.circleColorChanged.toggle()
////                        self.heartColorChanged.toggle()
////                        self.heartSizeChanged.toggle()
////                    })
//
//                DragGesture()
//                    .updating($dragOffset, body: { currentPosition, state, transaction in
//                        state = currentPosition.translation
//                    })
//                    .onEnded({ currentPosition in
//                    self.position.height += currentPosition.translation.height
//                    self.position.width += currentPosition.translation.width
//                })
//            )
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


import SwiftUI
struct ContentView: View {
    // 定义状态
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    @GestureState private var longPressTap = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    var body: some View {
        Text("")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
