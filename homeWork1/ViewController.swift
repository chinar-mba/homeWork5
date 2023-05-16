//
//  ViewController.swift
//  homeWork1
//
//  Created by Chinara on 5/15/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var data: [Product] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 150
        view.layer.cornerRadius = 60
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupView()
        
        APIManager.shared.getData { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.data = data.products
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(360)
        }
    }
}

            

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let model = data[indexPath.row]
        
        cell.title.text =  model.title
        cell.descriptionLabel.text = model.description
        
        if let imageURLString = model.images.first, let imageURL = URL(string: imageURLString) {
                   DispatchQueue.global().async {
                       if let imageData = try? Data(contentsOf: imageURL), let image = UIImage(data: imageData) {
                           DispatchQueue.main.async {
                               if tableView.indexPath(for: cell) == indexPath {
                                   cell.images.image = image
                               }
                           }
                       }
                   }
               }
               
               return cell
           }
       }
    




