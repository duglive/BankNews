//
//  NewsListViewController.swift
//  BankNews
//
//  Created by Саид Дагалаев on 16.12.2020.
//

import UIKit

class NewsVC: UIViewController {
    
    var model: NewsListModel!
    var router: Router!
    
    var tableView: UITableView = UITableView()
    
    private var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        configureNavigationController()
        
        configureRightBarItem()
        configureTableView()
        
        model.load()
    }
    
    private func setTitle() {
        self.title = "Новости"
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        tableView.pin(to: view)
        tableView.addSubview(refreshControl)
    }
    
    private func configureRightBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Источник", style: .plain, target: self, action: #selector(selectButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId) as! NewsCell
        let item = model.newsItems[indexPath.row]
        cell.set(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsIndex = indexPath.row
        
        router.show(in: self, index: newsIndex)
    }
}

extension NewsVC: NewsListModelOutput {
    func createAlertAboutError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введен некорректный URL", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateViewFromModel() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension NewsVC {
    @objc func selectButtonPressed() {
        let alertController = UIAlertController(title: "Сменить источник новостей", message: "", preferredStyle: .alert)
        alertController.view.tintColor = .systemGreen
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите URL"
        }
        
        let addButton = UIAlertAction(title: "Сменить", style: .default) { (_) in
            let input = alertController.textFields![0].text ?? ""
            self.model.prevUrlString = self.model.urlString
            self.model.urlString = input
            self.model.load()
        }
        
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(addButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func refresh() {
        model.load()
    }
}
