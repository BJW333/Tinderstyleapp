// SwipeView.swift
import SwiftUI

struct SwipeView: View {
    // Dummy data for demonstration
    let profiles = ["User1", "User2", "User3"]

    var body: some View {
        VStack {
            ForEach(profiles, id: \.self) { profile in
                Text(profile)
                    .frame(width: 300, height: 400)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .gesture(
                        DragGesture()
                            .onEnded { gesture in
                                if gesture.translation.width > 100 {
                                    // Swiped right
                                } else if gesture.translation.width < -100 {
                                    // Swiped left
                                }
                            }
                    )
            }
        }
    }
}
