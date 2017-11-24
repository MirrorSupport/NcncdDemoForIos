//
//  IndexVC.swift
//  NcncdDemo
//  健康信息交互系统Demo首页
//  Created by lihaotian on 2017/11/16.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd

class IndexVC: UITableViewController {
    
    let tabelTitles = ["上传血糖数据","上传健康数据","上传血压数据","上传运动数据","上传睡眠数据","上传血氧数据","上传心率数据","上传体温数据","上传用户数据"]
    
    let vcIdentifiers = ["BloodSugarTestVC", "HealthTestVC", "BloodPressureTestVC", "SportTestVC", "SleepTestVC", "BloodOxygenTestVC", "HeartRateTestVC", "TemperatureTestVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = "NcncdSDK"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row < self.tabelTitles.count - 1 {
            
            let bloodSugarTestVC = self.storyboard?.instantiateViewController(withIdentifier: self.vcIdentifiers[indexPath.row])
            self.navigationController?.pushViewController(bloodSugarTestVC!, animated: true)
            
        }else{
            
            let bundle = Bundle(identifier: "cn.miao.ncncd")
            let registerVC = NcncdRegisterVC.init(nibName: "NcncdRegisterVC", bundle: bundle)
            self.navigationController?.pushViewController(registerVC, animated: true)
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tabelTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //在重用机制里取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tabelTitles[indexPath.row]
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
