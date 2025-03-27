//
//  ContentView.swift
//  ToastMessageSwiftUI
//
//  Created by Nimish Mothghare on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showToast = false
    @State private var toastMessage: String? = nil
    var body: some View {
        VStack {
            Button {
                
                
                toastMessage = "This is a UIKit Toast!"

                
                
            } label: {
                Image(systemName: "house.fill")
                    .frame(width: 52, height: 52)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(15)
            }
            
            // UIKit Toast injected here
                      ToastControllerRepresentable(message: $toastMessage)
                          .frame(width: 0, height: 0) // invisible but active
                  }
        }
        
        
    }


#Preview {
    ContentView()
}
