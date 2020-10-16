//
//  NovoFuncionarioVC.swift
//  usuario
//
//  Created by Bruno Horta on 16/10/20.
//

import UIKit

// Interface PROTOCOLO
protocol NovoFuncionarioProtocol: class {
    func registraFuncionario(nome1: String?)
    func registraFuncionario(sobreNome1: String?)
    func registraFuncionario(email1: String?)
    func registraFuncionario(matricula1: String?)
}




class NovoFuncionarioVC: UIViewController {

    
    
    
    @IBOutlet weak var novoNomeTextField: UITextField!
    @IBOutlet weak var novoSobrenomeTextField: UITextField!
    @IBOutlet weak var novoEmailTextField: UITextField!
    @IBOutlet weak var novoMatriculaTextField: UITextField!
    
    
    weak var delegate: NovoFuncionarioProtocol?
    
    
    
    @IBAction func gravarNovoFunc(_ sender: Any) {
        
        self.delegate?.registraFuncionario(nome1: self.novoNomeTextField.text)
        self.delegate?.registraFuncionario(sobreNome1: self.novoSobrenomeTextField.text)
        self.delegate?.registraFuncionario(email1: self.novoEmailTextField.text)
        self.delegate?.registraFuncionario(matricula1: self.novoMatriculaTextField.text)
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    var novoCadastro: [Funcionario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
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
