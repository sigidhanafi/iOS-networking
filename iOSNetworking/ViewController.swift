//
//  ViewController.swift
//  iOSNetworking
//
//  Created by Sigit Hanafi on 02/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private var viewModel: ViewModel!
    
    private var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupTableView()
        
        setupViewModel()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // register UITableViewCell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }
    
    private func setupViewModel() {
        viewModel = ViewModel()
        
        // trigger load
        viewModel.didLoadTrigger()
        
        // handle completion / action
        viewModel.loadView = { [weak self] movies in
            self?.movies = movies
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
}

