//
//  HealthTestVC.swift
//  NcncdDemo
//  上传健康数据
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd
import MBProgressHUD

class HealthTestVC: UIViewController, NcncdApiDelegate {
    
    // bmi指数
    @IBOutlet weak var tfBmi: UITextField!
    // 体脂率
    @IBOutlet weak var tfBodyFat: UITextField!
    // 肌肉率
    @IBOutlet weak var tfMuscleRate: UITextField!
    // 水分
    @IBOutlet weak var tfMoistureRate: UITextField!
    // 骨密度
    @IBOutlet weak var tfBmd: UITextField!
    // 基础代谢率
    @IBOutlet weak var tfBmr: UITextField!
    
    // 数据内容展示
    @IBOutlet weak var textView: UITextView!
    
    // 数据缓存
    var datas: Array<Health> = []
    
    let httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "健康数据"
        
        // 修改输入框边框
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.black.cgColor
        
        tfBmi.text = "22.2"
        tfBodyFat.text = "44.3"
        tfMuscleRate.text = "34.0"
        tfMoistureRate.text = "12.4"
        tfBmd.text = "11.11"
        tfBmr.text = "9.99"
        
        addData(bmi: Float(tfBmi.text!)!, bodyFat: Float(tfBodyFat.text!)!, muscleRate: Float(tfMuscleRate.text!)!, moistureRate: Float(tfMoistureRate.text!)!, bmd: Float(tfBmd.text!)!, bmr: Float(tfBmr.text!)!)
    }
    
    /// 输入框长度限制
    ///
    /// - Parameter sender: sender
    @IBAction func tfLengthChange(_ sender: Any) {
        
        setUpTfLength(textF: sender as! UITextField, length: 6)
        
    }
    
    /// 添加输入Action
    ///
    /// - Parameter sender: sender
    @IBAction func actionAdd(_ sender: Any) {
        
        if tfBmi.text!.isEmpty || tfBodyFat.text!.isEmpty || tfMuscleRate.text!.isEmpty || tfMoistureRate.text!.isEmpty || tfBmd.text!.isEmpty || tfBmr.text!.isEmpty{
            
            showToast(view: self.view, message: "请完整填写内容")
            return
        }
        
        if !checkTfText(tfView: tfBmi, notice: "bmi指数格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfBodyFat, notice: "体脂率格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfMuscleRate, notice: "肌肉率格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfMoistureRate, notice: "水分格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfBmd, notice: "骨密度格式错误") {
            return
        }
        
        if !checkTfText(tfView: tfBmr, notice: "基础代谢率格式错误") {
            return
        }
        
        addData(bmi: Float(tfBmi.text!)!, bodyFat: Float(tfBodyFat.text!)!, muscleRate: Float(tfMuscleRate.text!)!, moistureRate: Float(tfMoistureRate.text!)!, bmd: Float(tfBmd.text!)!, bmr: Float(tfBmr.text!)!)
        
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
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - bmi: bmi指数
    ///   - bodyFat: 体脂率
    ///   - muscleRate: 肌肉率
    ///   - moistureRate: 水分
    ///   - bmd: 骨密度
    ///   - bmr: 基础代谢率
    func addData(bmi: Float, bodyFat: Float, muscleRate: Float, moistureRate: Float, bmd: Float, bmr: Float) {
        
        let health = Health()
        health.bmi = bmi
        health.bodyFat = bodyFat
        health.muscleRate = muscleRate
        health.moistureRate = moistureRate
        health.bmd = bmd
        health.bmr = bmr
        health.sampleTime = Int(Date().timeIntervalSince1970)
        
        datas.append(health)
        
        var text = "bmi指数：\(bmi) , 体脂率：\(bodyFat) , 肌肉率：\(muscleRate) , 水分：\(moistureRate) , 骨密度：\(bmd) , 基础代谢率：\(bmr)"
        if !textView.text.isEmpty {
            
            text.append("\n")
            text.append(textView.text)
        }
        
        textView.text = text
    }
    
    /// 上传处理
    ///
    /// - Parameter sender: sender
    @IBAction func actionUpload(_ sender: Any) {
        
        HealthApi.delegate = self
        HealthApi.uploadHealth(data: datas, telephone: "13889346578")
    }
    
    /// 重置数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionReset(_ sender: Any) {
        
        textView.text = ""
        
        tfBmi.text = "22.2"
        tfBodyFat.text = "44.3"
        tfMuscleRate.text = "34.0"
        tfMoistureRate.text = "12.4"
        tfBmd.text = "11.11"
        tfBmr.text = "9.99"
        
        addData(bmi: Float(tfBmi.text!)!, bodyFat: Float(tfBodyFat.text!)!, muscleRate: Float(tfMuscleRate.text!)!, moistureRate: Float(tfMoistureRate.text!)!, bmd: Float(tfBmd.text!)!, bmr: Float(tfBmr.text!)!)
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
        
        textView.text = ""
        
        tfBmi.text = "22.2"
        tfBodyFat.text = "44.3"
        tfMuscleRate.text = "34.0"
        tfMoistureRate.text = "12.4"
        tfBmd.text = "11.11"
        tfBmr.text = "9.99"
        
        addData(bmi: Float(tfBmi.text!)!, bodyFat: Float(tfBodyFat.text!)!, muscleRate: Float(tfMuscleRate.text!)!, moistureRate: Float(tfMoistureRate.text!)!, bmd: Float(tfBmd.text!)!, bmr: Float(tfBmr.text!)!)
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
