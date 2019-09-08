//
//  MainViewController.swift
//  SimpleWrite
//
//  Created by macOS on 2019/7/25.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var sum = 0
    var datas = [Record]()
    var record1 = Record(date: "2019.07.05", content: "晴天", title: "好天气")
    var record2 = Record(date: "2019.07.06", content: "下雷雨", title: "坏天气")
    @IBOutlet weak var fontTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ViewTableCell
        let text = datas[indexPath.row].date+" "+datas[indexPath.row].title
        //        print(text)
        
        cell.textLabel?.text = text
        //        cell.textLabel?.textColor = UIColor.black
        
        return cell
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.dataSource = self
        datas.append(record1)
        datas.append(record2)
        // Do any additional setup after loading the view.
    }

    @IBAction func edit(_ sender: UIButton) {
        let btn = sender
        let cell = btn.superView(of: UITableViewCell.self)!
        let indexPath = fontTableView.indexPath(for: cell)?.row
        print("indexPath：\(indexPath!)")
        self.performSegue(withIdentifier: "EditRecord", sender: datas[indexPath ?? 0])
    }
    @IBAction func newRecord(_ sender: UIButton) {
        self.performSegue(withIdentifier: "NewRecord", sender: datas)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditRecord"{
            let controller = segue.destination as! ViewController
            controller.data = sender as? Record
        }
        if segue.identifier == "NewRecord"{
            let controller = segue.destination as! NewViewController
            controller.datas = sender as? [Record]
        }
    }
    
    func superUITableViewCell(of: UIButton) -> UITableViewCell? {
        for view in sequence(first: of.superview, next: { $0?.superview }) {
            if let cell = view as? UITableViewCell {
                return cell
            }
        }
        return nil
    }
    
    @IBAction func back(unwindSegue : UIStoryboardSegue){
            fontTableView.reloadData()
        
    }
    @IBAction func newBack(unwindSegue : UIStoryboardSegue){
        let vc = unwindSegue.source as! NewViewController
        datas = vc.datas!
        fontTableView.reloadData()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIView {
    //返回该view所在的父view
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father
            }
        }
        return nil
    }
}
