//
//  ViewController.swift
//  AppFuncionarios
//
//  Created by Felipe Miranda on 09/10/20.
//

import UIKit

class FuncionarioVC: UIViewController {

    @IBOutlet weak var funcionarioTableView : UITableView!
    
    
    var arrayFuncionarios:[Funcionario] = [Funcionario(nome: "Felipe", sobrenome: "Miranda", email: "felipe@gmail.com", matricula: "23213323", img: UIImage(named: "funcFelipe")),Funcionario(nome: "Rodrigo", sobrenome: "Miranda", email: "rodrigo@gmail.com", matricula: "23213312"),Funcionario(nome: "Patricia", sobrenome: "Aleixo", email: "patricia@gmail.com", matricula: "23213124"),Funcionario(nome: "Caio", sobrenome: "fabrini", email: "caio@gmail.com", matricula: "23213356")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.funcionarioTableView.register(UINib(nibName: "FuncionarioTableViewCell", bundle: nil), forCellReuseIdentifier: "FuncionarioTableViewCell")
        
        self.funcionarioTableView.delegate = self
        self.funcionarioTableView.dataSource = self
        // Do any additional setup after loading the view.
    }



}
extension FuncionarioVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayFuncionarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FuncionarioTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FuncionarioTableViewCell", for: indexPath) as? FuncionarioTableViewCell
        
        cell?.setup(value: self.arrayFuncionarios[indexPath.row])
    
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(self.arrayFuncionarios[indexPath.row].nome)
        print(self.arrayFuncionarios[indexPath.row])
        print(indexPath.row)
        
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        self.arrayFuncionarios.remove(at: indexPath.row)
        print("count do array\(self.arrayFuncionarios.count)")
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}
