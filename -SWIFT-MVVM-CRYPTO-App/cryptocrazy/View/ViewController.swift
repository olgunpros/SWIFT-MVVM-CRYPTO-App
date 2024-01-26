//
//  ViewController.swift
//  cryptocrazy
//
//  Created by Olgun ‏‏‎‏‏‎ on 25.01.2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cryptoVM = CryptoViewModel()
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupBindings()
        cryptoVM.requestData()
        
    }
    private func setupBindings() {
        cryptoVM.error.observe(on: MainScheduler.asyncInstance).subscribe { errorString in
        print (errorString)
        }.disposed(by: disposeBag)
        
        cryptoVM.cryptos.observe(on: MainScheduler.asyncInstance).subscribe {
            cryptos in self.cryptoList = cryptos
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }

}

