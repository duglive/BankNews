//
//  NewsDetailsVC.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    var model: NewsDetailsModel!
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.right
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = .systemFont(ofSize: 25, weight: .black)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 20)
        textView.isEditable = false
        textView.textAlignment = .natural
        textView.scrollRangeToVisible(NSMakeRange(0, 1))
        textView.setContentOffset(CGPoint.zero, animated: false)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        model.load()
        model.makeNewsViewed()
        
        configureValues()
        setUpConstraints()
    }
    
    private func configureValues() {
        textView.text = model.news.description.html2String
        dateLabel.text = model.news.date
        titleLabel.text = model.news.title
    }
    
    private func setUpConstraints() {
        view.addSubview(dateLabel)
        view.addSubview(titleLabel)
        view.addSubview(textView)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
