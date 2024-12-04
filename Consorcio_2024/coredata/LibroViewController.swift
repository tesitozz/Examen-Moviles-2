

import UIKit

class LibroViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var cvLibros: UICollectionView!
    var lista:[Libros]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        llenarArreglos()
        cvLibros.dataSource=self
        cvLibros.delegate=self

    }
    

    
    @IBAction func btnNuevo(_ sender: UIButton) {
    }
    
    func llenarArreglos(){
        lista.append(Libros(codigo: 1, titulo: "harry1", precio: 78.5, stock: 20))
        lista.append(Libros(codigo: 2, titulo: "harry2", precio: 98.4, stock: 30))
        lista.append(Libros(codigo: 3, titulo: "harry3", precio: 61.5, stock: 15))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //objeto de la clase ItemLibroCollectionViewCell
        
        let fila=collectionView.dequeueReusableCell(withReuseIdentifier: "row", for: indexPath) as! ItemLibroCollectionViewCell
        fila.imgFoto.image=UIImage(named: lista[indexPath.row].titulo)
        fila.lblTitulo.text=lista[indexPath.row].titulo
        
        
        return fila
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "nuevoLibro", sender: nil)
    }
    
    
}
