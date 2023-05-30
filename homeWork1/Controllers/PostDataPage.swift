//
//  PostDataPage.swift
//  homeWork1
//
//  Created by Chinara on 5/28/23.
//

import UIKit

class PostDataPage: UIViewController {
    
    private let welcomelabel: UILabel = {
        let view = UILabel()
        view.text = "Please enter a new data"
        view.textColor = .black
        view.font = view.font.withSize(28)
        return view
    }()
    
    private let idLabel: UILabel = {
        let view = UILabel()
        view.text = "id"
        view.textColor = .black
        view.font = UIFont(name: "Poppins", size: 18)
        return view
    }()
    
    private let idTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 6
        view.placeholder = "ID"
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "title"
        view.textColor = .black
        view.font = UIFont(name: "Poppins", size: 18)
        return view
    }()
    private let titleTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 6
        view.placeholder = "Title"
        return view
    }()
    
    private let button: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 22
        view.setTitle("Register", for: .normal)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addUI()
        uiUpdate()
        actionUI()
    }
    
    func addUI() {
        view.addSubview(welcomelabel)
        view.addSubview(idLabel)
        view.addSubview(idTextField)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(button)
    }
    
    func uiUpdate() {
        welcomelabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(50)
            make.height.equalTo(200)
        }
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomelabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(30)
        }
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(30)
        }
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
    }
        func actionUI() {
            button.addTarget(self, action: #selector(getRequest), for: .touchUpInside)
    
        }
    @objc func getRequest(sender: UIButton) {
        APIManager.shared.postRequest(id: Int(idTextField.text!)!, title: titleTextField.text ?? "") { result in
            switch result {
            case .success(let code):
                DispatchQueue.main.async {
                    self.showAlert(title: "Status code", message: "your status code is: \(code)")
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                break
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
