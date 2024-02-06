// ProfileCreationView.swift
import SwiftUI
import FirebaseStorage

struct ProfileCreationView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .padding()
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Button("Select Image") {
                isImagePickerPresented = true
            }
            Button("Save Profile") {
                saveProfile()
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedImage)
        }
        .padding()
    }

    private func saveProfile() {
        guard let imageData = selectedImage?.jpegData(compressionQuality: 0.4) else { return }

        let storageRef = Storage.storage().reference()
        let profileImageRef = storageRef.child("profileImages/\(UUID().uuidString).jpg")

        profileImageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error)")
                return
            }

            profileImageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error)")
                    return
                }

                if let url = url {
                    // Save URL with other profile data in Firebase Database
                }
            }
        }
    }
}
