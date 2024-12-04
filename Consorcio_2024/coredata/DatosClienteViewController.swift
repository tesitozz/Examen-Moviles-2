

import UIKit

class DatosClienteViewController: UIViewController {
    
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtCredito: UITextField!
    
   
    var obj: ClienteEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCodigo.text=String(obj.codigo)
        txtNombre.text=obj.nombre
        txtApellidos.text=obj.apellido
        txtCredito.text=String(obj.credito)

        
    }
    
    
    @IBAction func btnModificar(_ sender: UIButton) {
        let cod=getCodigo()
        let nom=getNombre()
        let ape=getApellido()
        let cred=getCredito()
        obj.nombre=nom
        obj.apellido=ape
        obj.credito=cred
        //invocar funcion update
        let salida=ControladorCliente().update(bean: obj)
        if salida>0{
            ventana("Cliente actualizado")
        }
        else {
            ventana("Error en la actualizacion")
        }
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
        
        let pantalla=UIAlertController(title: "Sistema", message: "Seguro de eliminar Cliente?", preferredStyle: .alert)
        //adicionar boton
        pantalla.addAction(UIAlertAction(title: "Aceptar", style: .default,handler:{
            action in
            let salida=ControladorCliente().delete(bean: self.obj)
            if salida>0{
                self.ventana("Cliente eliminado")
            }else {
                self.ventana("Error en la eliminacion")
            }
        }))
        pantalla.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        //mostrar pantalla
        present(pantalla, animated: true)
        
    }
    
    @IBAction func btnCerrar(_ sender: UIButton) {
        performSegue(withIdentifier: "volver2", sender: nil)
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
