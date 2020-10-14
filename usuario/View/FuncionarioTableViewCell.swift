//
//  usuarioTableViewCell.swift
//  usuario
//
//  Created by Bruno Horta on 9/10/20.
//

import UIKit

class FuncionarioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var sobrenome: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var imagem: UIImageView!
    
    //SETUP da celula
    func setup(value: Funcionario?){
        guard let _value = value else {return}//expRica
        self.nome.text = _value.nome
        self.sobrenome.text = _value.sobrenome
        self.email.text = _value.email
        self.imagem.image = _value.img
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagem.arredondar()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension UIImageView {

    func arredondar() {

//        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill //zoom na proporcao
        
    }
}
