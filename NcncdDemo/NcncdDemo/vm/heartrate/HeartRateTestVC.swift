//
//  HeartRateTestVC.swift
//  NcncdDemo
//  上传心率数据
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd
import MBProgressHUD

class HeartRateTestVC: UIViewController, NcncdApiDelegate {
    
    // 平均心率
    @IBOutlet weak var tfAverage: UITextField!
    // 最大心率
    @IBOutlet weak var tfMax: UITextField!
    // 最低心率
    @IBOutlet weak var tfMin: UITextField!
    // 时间间隔
    @IBOutlet weak var tfTime: UITextField!
    
    // 数据内容
    @IBOutlet weak var textView: UITextView!
    
    var datas: Array<HeartRate> = []
    
    let httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "心率数据"
        
        // 修改输入框边框
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.black.cgColor
        
        tfAverage.text = "11.1"
        tfMax.text = "33.3"
        tfMin.text = "11.1"
        tfTime.text = "1000"
        
        addData(average: Float(tfAverage.text!)!, max: Float(tfMax.text!)!, min: Float(tfMin.text!)!, time: Int(tfTime.text!)!)
        
    }
    
    /// 限制输入框长度
    ///
    /// - Parameter sender: sender
    @IBAction func checkTfLength(_ sender: Any) {
        
        setUpTfLength(textF: sender as! UITextField, length: 6)
    }
    
    /// 添加数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionAdd(_ sender: Any) {
        
        if tfAverage.text!.isEmpty || tfMax.text!.isEmpty || tfMin.text!.isEmpty || tfTime.text!.isEmpty {
            
            showToast(view: self.view, message: "请完整填写内容")
            return
        }
        
        if !checkTfText(tfView: tfAverage, notice: "平均心率格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfMax, notice: "最大心率格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfMin, notice: "最低心率格式错误") {
            return
        }
        
        addData(average: Float(tfAverage.text!)!, max: Float(tfMax.text!)!, min: Float(tfMin.text!)!, time: Int(tfTime.text!)!)
        
    }
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - average: 平均心率
    ///   - max: 最大心率
    ///   - min: 最低心率
    ///   - time: 时间间隔
    func addData(average: Float, max: Float, min: Float, time: Int) {
        
        let hearRate = HeartRate()
        hearRate.deviceNo = "DeviceNo"
        hearRate.average = average
        hearRate.max = max
        hearRate.min = min
        hearRate.beginTime = Int(Date().timeIntervalSince1970) - time
        hearRate.endTime = Int(Date().timeIntervalSince1970)
        
        datas.append(hearRate)
        
        var text = "平均心率：\(average) , 最大心率：\(max) , 最低心率：\(min)"
        if !textView.text.isEmpty {
            
            text.append("\n")
            text.append(textView.text)
        }
        
        textView.text = text
        
    }
    
    /// 判断输入的内容格式是否正确
    ///
    /// - Parameters:
    ///   - tfView: 输入框View
    ///   - notice: 错误提示内容
    /// - Returns: 是否正确
    func checkTfText(tfView: UITextField , notice: String) -> Bool {
        
        if Float(tfView.text!) == nil {
            
            showToast(view: self.view, message: notice)
            return false
        }
        
        return true
    }
    
    /// 上传数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionUpload(_ sender: Any) {
        
        HeartRateApi.delegate = self
        HeartRateApi.uploadHeartRate(data: datas, telephone: "18911442790")
    }
    
    /// 重置数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionReset(_ sender: Any) {
        
        textView.text = ""
        
        tfAverage.text = "11.1"
        tfMax.text = "33.3"
        tfMin.text = "11.1"
        tfTime.text = "1000"
        
        addData(average: Float(tfAverage.text!)!, max: Float(tfMax.text!)!, min: Float(tfMin.text!)!, time: Int(tfTime.text!)!)
        
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
        
        textView.text = ""
        
        tfAverage.text = "11.1"
        tfMax.text = "33.3"
        tfMin.text = "11.1"
        tfTime.text = "1000"
        
        addData(average: Float(tfAverage.text!)!, max: Float(tfMax.text!)!, min: Float(tfMin.text!)!, time: Int(tfTime.text!)!)
        
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
