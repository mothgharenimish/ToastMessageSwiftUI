//
//  ToastViewController.swift
//  ToastMessageSwiftUI
//
//  Created by Nimish Mothghare on 26/03/25.
//

import UIKit
import SwiftUI

class ToastViewController: UIViewController {
    
    
    func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        toastLabel.textColor = .white
        toastLabel.font = UIFont.systemFont(ofSize: 14)
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true

        let maxWidthPercentage: CGFloat = 0.8
        let maxTitleSize = CGSize(width: self.view.bounds.size.width * maxWidthPercentage, height: self.view.bounds.size.height)
        var expectedSize = toastLabel.sizeThatFits(maxTitleSize)
        expectedSize.width += 20
        expectedSize.height += 20

        toastLabel.frame = CGRect(
            x: (self.view.frame.size.width - expectedSize.width) / 2,
            y: self.view.frame.size.height - expectedSize.height - (-240),
            width: expectedSize.width,
            height: expectedSize.height
        )

        self.view.addSubview(toastLabel)

        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


struct ToastControllerRepresentable: UIViewControllerRepresentable {
    @Binding var message: String?

    func makeUIViewController(context: Context) -> ToastViewController {
        ToastViewController()
    }

    func updateUIViewController(_ uiViewController: ToastViewController, context: Context) {
        if let msg = message {
            uiViewController.showToast(message: msg)
            DispatchQueue.main.async {
                message = nil
            }
        }
    }
}
