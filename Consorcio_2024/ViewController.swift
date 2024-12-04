

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tvClientes: UITableView!
    //var lista:[Cliente]=[]
    var lista:[ClienteEntity]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lista=ControladorCliente().findAll()
        //llenarArreglo()
        //indicar que la tabla tiene origen de datos
        tvClientes.dataSource=self
        //establecer alto de la celda
        tvClientes.rowHeight=180
        //asignar delegado a la tabla
        tvClientes.delegate=self
        
    }
    
    @IBAction func btnNuevo(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevo", sender: nil)
    }
    
    /*func llenarArreglo(){
        lista.append(Cliente(codigo: 1, nombre: "Juan", apellido: "Castro Oca", credito: 5200))
        lista.append(Cliente(codigo: 2, nombre: "Ana", apellido: "Rojas Salas", credito: 14700))
        lista.append(Cliente(codigo: 3, nombre: "Rosa", apellido: "Paucar Lara", credito: 8700))
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear objeto de la clase itemTableViewCell
        let fila=tvClientes.dequeueReusableCell(withIdentifier: "row") as!
        ItemTableViewCell
        fila.lblCodigo.text=String(lista[indexPath.row].codigo)
        fila.lblNombre.text=lista[indexPath.row].nombre
        return fila
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "datos", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="datos" {
            //objeto de la clase DatosClienteViewController
            let pantalla2=segue.destination as! DatosClienteViewController
            pantalla2.obj=lista[tvClientes.indexPathForSelectedRow!.row]
        }
        
    }
    
}
