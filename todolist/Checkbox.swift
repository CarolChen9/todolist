//
//  Checkbox.swift
//  todolist
//
//  Created by carol chen on 2021/5/14.
//

import UIKit

@IBDesignable
class Checkbox: UIControl {

    private weak var imageView: UIImageView!
    
    private var image: UIImage {
        return checking ? UIImage(systemName: "checkmark.square.fill")!:UIImage(systemName: "square")!
    }
    
    @IBInspectable
    public var checking: Bool = false {
        didSet {
            imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        backgroundColor = UIColor.clear
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        self.imageView = imageView
        
        
        addTarget(self, action: #selector(touchInside), for: .touchUpInside)
    }
    
    @objc func touchInside() {
        checking = !checking
        sendActions(for: .valueChanged)
    }
}
