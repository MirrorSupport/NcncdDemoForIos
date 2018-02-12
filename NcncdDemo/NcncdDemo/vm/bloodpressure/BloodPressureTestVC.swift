//
//  BloodPressureTestVC.swift
//  NcncdDemo
//  上传血压数据
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd
import MBProgressHUD

class BloodPressureTestVC: UIViewController, NcncdApiDelegate {

    // 舒张压
    @IBOutlet weak var tfDiastolic: UITextField!
    // 收缩压
    @IBOutlet weak var tfSystolic: UITextField!
    
    // 数据内容
    @IBOutlet weak var textView: UITextView!
    
    var datas: Array<BloodPressure> = []
    
    let httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "血压数据"
        
        // 修改输入框边框
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.black.cgColor
        
        tfDiastolic.text = "102"
        tfSystolic.text = "202"
        
        addData(diastolic: 102, systolic: 202)
    }
    
    /// 限制输入框长度
    ///
    /// - Parameter sender: sender
    @IBAction func tfCheckLength(_ sender: Any) {
        
        setUpTfLength(textF: sender as! UITextField, length: 6)
    }
    
    /// 添加数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionAdd(_ sender: Any) {
        
        if tfDiastolic.text!.isEmpty || tfSystolic.text!.isEmpty {
            
            showToast(view: self.view, message: "请完整填写内容")
            return
        }
        
        addData(diastolic: Int(tfDiastolic.text!)!, systolic: Int(tfSystolic.text!)!)
        
    }
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - diastolic: 舒张压
    ///   - systolic: 收缩压
    func addData(diastolic: Int , systolic: Int) {
        
        let bloodPressure = BloodPressure()
        bloodPressure.diastolic = diastolic
        bloodPressure.systolic = systolic
        bloodPressure.sampleTime = Int(Date().timeIntervalSince1970)
        
        datas.append(bloodPressure)

        var text = "舒张压：\(diastolic) , 收缩压：\(systolic)"
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
        
        BloodPressureApi.delegate = self
        BloodPressureApi.uploadBloodPressure(data: datas, telephone: "18911442799")
    }
    
    /// 重置数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionReset(_ sender: Any) {
        
        textView.text = ""
        
        tfDiastolic.text = "102"
        tfSystolic.text = "202"
        
        addData(diastolic: 102, systolic: 202)
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
        
        textView.text = ""
        
        tfDiastolic.text = "102"
        tfSystolic.text = "202"
        
        addData(diastolic: 102, systolic: 202)
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
