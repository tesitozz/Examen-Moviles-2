

import UIKit

class NuevoClienteViewController: UIViewController {
    
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtCredito: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        

        
    }
    
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        let cod=getCodigo()
        let nom=getNombre()
        let ape=getApellido()
        let cred=getCredito()
        let obj=Cliente(codigo: cod, nombre: nom, apellido: ape, credito: cred)
        var estado=ControladorCliente().save(bean: obj)
        if estado>0{
            ventana("Cliente registrado con exito")
        }
        else {
            ventana("Cliente no registrado")
        }
    }
    
    @IBAction func btnCerrar(_ sender: UIButton) {
        performSegue(withIdentifier: "volver1", sender: nil)
        
    }
    
    func getCodigo()->Int{
        return Int(txtCodigo.text ?? "0") ?? 0
    }
    func getNombre()->String {
        return txtNombre.text ?? ""
        
    }
    func getApellido()->String {
        return txtApellidos.text ?? ""
    }
    func getCredito()->Double{
        return Double(txtCredito.text ?? "0") ?? 0
    }
    //ventana de alerta
    func ventana(_ msg:String){
        let pantalla=UIAlertController(title: "Sistema", message: msg, preferredStyle: .alert)
        //adicionar boton
        pantalla.addAction(UIAlertAction(title: "Aceptar", style: .default))
        //mostrar pantalla
        present(pantalla, animated: true)
    }
    
   

}
