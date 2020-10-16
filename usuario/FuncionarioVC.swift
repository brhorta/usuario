//
//  ViewController.swift
//  AppFuncionarios
//
//  Created by Felipe Miranda on 09/10/20.
//

import UIKit

class FuncionarioVC: UIViewController, NovoFuncionarioProtocol {
    func registraFuncionario(nome1: String?) {
        self.arrayFuncionarios.append(Funcionario(nome: nome1))
    }
    
    func registraFuncionario(sobreNome1: String?) {
        self.arrayFuncionarios.append(Funcionario(sobrenome: sobreNome1))

    }
    
    func registraFuncionario(email1: String?) {
        self.arrayFuncionarios.append(Funcionario(email: email1))

    }
    
    func registraFuncionario(matricula1: String?) {
        self.arrayFuncionarios.append(Funcionario(matricula: matricula1))

    }
    

    @IBOutlet weak var funcionarioTableView : UITableView!

    
   
    
    var arrayFuncionarios:[Funcionario] = [Funcionario(nome: "Felipe", sobrenome: "Miranda", email: "felipe@gmail.com", matricula: "23213323", img: UIImage(named: "funcFelipe")),Funcionario(nome: "Rodrigo", sobrenome: "Miranda", email: "rodrigo@gmail.com", matricula: "23213312", img: UIImage(named: "funcRodrigo")),Funcionario(nome: "Patricia", sobrenome: "Aleixo", email: "patricia@gmail.com", matricula: "23213124", img: UIImage(named: "funcPatricia")),Funcionario(nome: "Caio", sobrenome: "fabrini", email: "caio@gmail.com", matricula: "23213356", img: UIImage(named: "funcCaio"))]
    
    
    //testando passagem de dados para detalheVC
    var detalheVCArray: [Funcionario] = []

    
    @IBAction func novoButton(_ sender: Any) {
        performSegue(withIdentifier: "NovoFuncionarioVC", sender: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //=========== CARREGANDO A TABLEVIEW ==========
        self.funcionarioTableView.register(UINib(nibName: "FuncionarioTableViewCell", bundle: nil), forCellReuseIdentifier: "FuncionarioTableViewCell")
        
        self.funcionarioTableView.delegate = self
        self.funcionarioTableView.dataSource = self
        //================== FIM ===================
        // Do any additional setup after loading the view.
        
        print(" Numero de itens\(arrayFuncionarios.count)")
        
        
        
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
        
        
        //print(self.arrayFuncionarios[indexPath.row].nome)
        detalheVCArray = [self.arrayFuncionarios[indexPath.row]]
        
        //print(self.arrayFuncionarios[indexPath.row])
        //print(indexPath.row)
        self.performSegue(withIdentifier: "DetalheVC", sender: nil)

    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // ========== REMOVENDO AS CELULAS ================
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        self.arrayFuncionarios.remove(at: indexPath.row)
        print("count do array\(self.arrayFuncionarios.count)")
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    //===== PASSANDO OS DADOS E PREPARANDO PARA RECEBER OUTROS VIA !!!SEGUE!!! =====
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detalheVC = segue.destination as? DetalheVC else {return}
        detalheVC.arrayInteiro = detalheVCArray
        
        let dadosNovos: NovoFuncionarioVC? = segue.destination as? NovoFuncionarioVC
        dadosNovos?.delegate = self

    }
    //==============================================================================
    
//    extension FuncionarioVC: NovoFuncionarioProtocol {
//        func registraFuncionario(nome1: String?){
//            self.arrayFuncionarios.append(Funcionario(nome: nome1))
//        }
//        func registraFuncionario(sobreNome1: String?){
//            self.arrayFuncionarios.append(Funcionario(sobrenome: sobreNome1))
//        }
//        func registraFuncionario(email1: String?){
//            self.arrayFuncionarios.append(Funcionario(email: email1))
//        }
//        func registraFuncionario(matricula1: String?){
//            self.arrayFuncionarios.append(Funcionario(matricula: matricula1))
//        }
//    }
    
    
    
}
