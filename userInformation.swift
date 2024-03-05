import UIKit  

class ViewController: UIViewController {  
    @IBOutlet weak var createUserSuccessView: UIView!  

    @IBOutlet weak var nameTextField: UITextField!  

    @IBOutlet weak var emailTextField: UITextField!  

    @IBOutlet weak var passwordTextField: UITextField!  

    @IBOutlet weak var mobileTextField: UITextField!  

    @IBOutlet weak var sbmtLbl: UILabel!  

    @IBOutlet weak var messageNameLbl: UILabel!  

    override func viewDidLoad() {  
        super.viewDidLoad()  
        // Do any additional setup after loading the view.  
        setInitViews()  
        sbmtLbl.isUserInteractionEnabled = true  
        let tap = UITapGestureRecognizer(target: self, action: #selector(sbmtBtnTapped(sender:)))  
        sbmtLbl.addGestureRecognizer(tap)  
    }  
    func setInitViews(){  
        nameTextField.becomeFirstResponder()  
        emailTextField.delegate = self  
        mobileTextField.delegate = self  
        nameTextField.delegate = self  
        passwordTextField.delegate = self  

    }  


    @objc func sbmtBtnTapped(sender: UITapGestureRecognizer){  
        if(nameTextField.text?.isEmpty ?? false || emailTextField.text?.isEmpty ?? false || passwordTextField.text?.isEmpty ?? false || passwordTextField.text?.isEmpty ?? false){  
            let alert = UIAlertController(title: nil, message: "Please fill all the details", preferredStyle: .alert)  
            let action = UIAlertAction(title: "OK", style: .default) { (action) in  
                self.dismiss(animated: true, completion: nil)  
            }  
            alert.addAction(action)  
            self.present(alert, animated: true, completion: nil)  
        }  
        else{  
            messageNameLbl.text = "Hi " + (nameTextField.text ?? "")  
            createUserSuccessView.isHidden = false  

        }  
    }  
}  


extension ViewController:UITextFieldDelegate{  

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {  
        if(textField == mobileTextField){  
            let currrentCharacterCount = textField.text?.count ?? 0  
            if range.length + range.location > currrentCharacterCount {  
                return false  
            }  
            let newLength = currrentCharacterCount + string.count - range.length  
            return newLength <= 10  
        }  
        else{  
        return true  
        }  
    }  
}  