

import UIKit
class ControladorCliente: PMetodos {
    
    func save(bean: Cliente) -> Int {
        var salida = -1
        
        //paso 1 crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //paso 2 variable para almacenar el valor de persistenContainer
        let contextoBD=delegate.persistentContainer.viewContext
        //paso 3 : objeto de ls entidad "ClienteEntity"
        let tabla=ClienteEntity(context: contextoBD)
        //paso 4 : asignar valor al objeto tabla
        tabla.codigo=Int16(bean.codigo)
        tabla.nombre=bean.nombre
        tabla.apellido=bean.apellido
        tabla.credito=bean.credito
        //paso5 : controlar exception
        do{
            //6.Grabar
            try contextoBD.save()
            salida=1
            
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return salida
    }
    
    func findAll() -> [ClienteEntity] {
        var datos:[ClienteEntity]!
        let delegate=UIApplication.shared.delegate as! AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        let registro=ClienteEntity.fetchRequest()
        do{
            try datos = contextoBD.fetch(registro)
            
        } catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return datos
        
        
    }
    
    func update(bean: ClienteEntity) -> Int {
        var estado = -1
        let delegate=UIApplication.shared.delegate as! AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        do{
            
            try contextoBD.save()
            estado = 1
            
        } catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return estado
        
    }
    
    func delete(bean: ClienteEntity) -> Int {
        var estado = -1
        let delegate=UIApplication.shared.delegate as! AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        do{
        contextoBD.delete(bean)
            try contextoBD.save()
            estado = 1
            
        } catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return estado
        
    }
    

}
