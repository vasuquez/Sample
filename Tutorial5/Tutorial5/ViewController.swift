//
//  ViewController.swift
//  Tutorial5
//
//  Created by 古堅ニノスカ on 2020/11/28.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    //aaaa
    // APIのURL
    let url = URL(string: "https://5xqq8vderh.execute-api.ap-northeast-1.amazonaws.com/Prod/practice")!
    var list = [Item]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("レスポンスエラー: \(error.localizedDescription)")
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                print("レスポンスのデータが空です")
                return
            }
            if response.statusCode == 200 {
                do {
                    let dto: [Template] = try JSONDecoder().decode([Template].self, from: data)
                    for i in dto {
                        self.list.append(Item( name: i.name,atack:i.atack))
                    }
                    DispatchQueue.main.sync {
                        // レスポンスのデータをリストに更新する
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Jsonデコードエラー")
                }
            } else {
                print("サーバー・エラー・ステータスコード: \(response.statusCode)")
            }
        }).resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].getName()
       // cell.imageView?.image = list[indexPath.row].getImg()
        cell.detailTextLabel?.text = list[indexPath.row].getAtack()
        return cell
    }
    
    
}
