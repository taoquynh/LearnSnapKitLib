//
//  ViewController.swift
//  DemoSnapKit
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let cellIdentifier = "CellIdentifier"
    let demos = ["Simple Layout", "Basic UIScrollView", "Login ViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SnapKit iOS Demos"
        setupTableView()
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = demos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = SimpleLayoutViewController()
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1 {
            let vc = BasicLayoutViewController()
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2 {
            let vc = LoginViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
