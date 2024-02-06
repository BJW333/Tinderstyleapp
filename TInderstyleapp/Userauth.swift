// LoginView.swift
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showingProfileCreation = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
            Button("Login") {
                loginUser()
            }
            Button("Register") {
                registerUser()
            }
        }
        .padding()
        .sheet(isPresented: $showingProfileCreation) {
            ProfileCreationView()
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
            } else {
                // Proceed to main app
            }
        }
    }
    
    private func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error registering: \(error.localizedDescription)")
            } else {
                showingProfileCreation = true
            }
        }
    }
}
