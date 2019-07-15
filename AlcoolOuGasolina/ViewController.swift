//
//  ViewController.swift
//  AlcoolOuGasolina
//
//  Created by Eduarda Mello on 25/02/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        //os ifs servem para ter certeza q existe um valor que foi digitado
        if let precoAlcool = precoAlcoolCampo.text{
            if let precoGasolina = precoGasolinaCampo.text{
                //validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if  validaCampos{
                    //calcular melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                }else{
                    resultadoLegenda.text = "Digite os preços para calcular!"
                }
                
                
            }
        }
    }
    
        func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        //converter texto pra numero para fazermos operaçoes
            if let valorAlcool = Double(precoAlcool){
                if let valorGasolina = Double(precoGasolina ){
                    //conta pra saber qual mais em conta
                    let resultadoPreco = valorAlcool / valorGasolina
                    
                    if resultadoPreco >= 0.7{
                        self.resultadoLegenda.text = "Melhor utilizar GASOLINA!"
                    }else{
                        self.resultadoLegenda.text = "Melhor utilizar ÁLCOOL!"
                    }
                }
            }
        }
    
    
        func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
            var camposValidados = true
            
            if precoAlcool.isEmpty{
                camposValidados = false
            }else if precoGasolina.isEmpty{
                camposValidados = false
            }
            
            return camposValidados
        }
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

