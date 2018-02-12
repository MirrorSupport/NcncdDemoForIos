//
//  SportTestVC.swift
//  NcncdDemo
//  上传运动数据
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd
import MBProgressHUD

class SportTestVC: UIViewController, NcncdApiDelegate {
    
    // 步数
    @IBOutlet weak var tfStep: UITextField!
    // 距离，单位：米
    @IBOutlet weak var tfDistance: UITextField!
    // 时间间隔
    @IBOutlet weak var tfTime: UITextField!
    
    // 内容数据
    @IBOutlet weak var textView: UITextView!
    
    var datas: Array<Sport> = []
    
    let httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "运动数据"
        
        // 修改输入框边框
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.black.cgColor
        
        tfStep.text = "10000"
        tfDistance.text = "4500"
        tfTime.text = "10000"
        
        addData(step: Int(tfStep.text!)!, distance: Int(tfDistance.text!)!, time: Int(tfTime.text!)!)
        
    }
    
    /// 限制输入字数
    ///
    /// - Parameter sender: sender
    @IBAction func checkTfLength(_ sender: Any) {
        
        setUpTfLength(textF: sender as! UITextField, length: 6)
    }
    
    /// 添加数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionAdd(_ sender: Any) {
        
        if tfStep.text!.isEmpty || tfDistance.text!.isEmpty || tfTime.text!.isEmpty{
            
            showToast(view: self.view, message: "请完整填写内容")
            return
        }
        
        addData(step: Int(tfStep.text!)!, distance: Int(tfDistance.text!)!, time: Int(tfTime.text!)!)
    }
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - step: 步数
    ///   - distance: 距离
    ///   - time: 时间间隔
    func addData(step: Int, distance: Int, time: Int) {
        
        let sport = Sport()
        sport.step = step
        sport.distance = distance
        sport.beginTime = Int(Date().timeIntervalSince1970) - time
        sport.endTime = Int(Date().timeIntervalSince1970)
        
        datas.append(sport)
        
        var text = "步数：\(step) , 距离：\(distance)"
        if !textView.text.isEmpty {
            
            text.append("\n")
            text.append(textView.text)
        }
        
        textView.text = text
        
    }
    
    /// 上传数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionUpload(_ sender: Any) {
        
        SportApi.delegate = self
        SportApi.uploadSport(data: datas, telephone: "13990907788")
        
    }
    
    /// 重置数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionReset(_ sender: Any) {
        
        textView.text = ""
        
        tfStep.text = "10000"
        tfDistance.text = "4500"
        tfTime.text = "10000"
        
        addData(step: Int(tfStep.text!)!, distance: Int(tfDistance.text!)!, time: Int(tfTime.text!)!)
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
        
        textView.text = ""
        
        tfStep.text = "10000"
        tfDistance.text = "4500"
        tfTime.text = "10000"
        
        addData(step: Int(tfStep.text!)!, distance: Int(tfDistance.text!)!, time: Int(tfTime.text!)!)
    }
    
    func httpError(httpError: Error) {
        
        showToast(view: self.view, message: "请求异常，请检查您的网络并稍后再试")
    }
    
    func failure(errNo: Int, errMsg: String) {
        
        
        showToast(view: self.view, message: errMsg)
    }
    
    func finish() {
        
        httpAlert.hide(animated: true)
    }
    
    /// 回收键盘
    ///
    /// - Parameters:
    ///   - touches:
    ///   - event:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
