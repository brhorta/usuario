//
//  DetalheVC.swift
//  usuario
//
//  Created by Bruno Horta on 15/10/20.
//

import UIKit

class DetalheVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var sobrenomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var matriculaLabel: UILabel!
    
    var arrayInteiro: [Funcionario] = []
   
    
    
    
//    var arrayFuncionarios2: [Funcionario] = [Funcionario]() // declarando varialvel para acessar os dados da outra tela


    override func viewDidLoad() {
        super.viewDidLoad()

//====== Forma de capturar os dados de outra tela, ou de qualquer array de lá ========
//        let vc1 = FuncionarioVC()
//        arrayFuncionarios2 = vc1.arrayFuncionarios
//        print(arrayFuncionarios2)
//====== Forma de capturar os dados de outra tela, ou de qualquer array de lá ========

        // Do any additional setup after loading the view.
        nomeLabel.text = arrayInteiro[0].nome
        sobrenomeLabel.text = arrayInteiro[0].sobrenome
        emailLabel.text = arrayInteiro[0].email
        matriculaLabel.text = arrayInteiro[0].matricula
        img.image = arrayInteiro[0].img
        
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
