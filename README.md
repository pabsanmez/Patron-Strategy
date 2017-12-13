# Patrón Strategy en una Tableview utilizando MVVM.

El patrón strategy permite cambiar el comportamiento de un algoritmo en tiempo de ejecución. Mediante el uso de interfaces es posible encapsular cada uno e intercambiarlos a nuestro gusto y elegir en tiempo de ejecución que algoritmo utilizar.

En este caso aplicado a una *tableview* vamos a delegar la responsabilidad de pintarse a cada tipo celda. Así vamos a poder crear una tabla que permita añadir nuevos tipos de celdas de una manera muy sencilla de las cuales no nos tendremos que preocupar de rellenar con una información u otra dependiendo de su tipo porque se auto gestionaran. 

Primero comenzamos declarando el protocolo que van a implementar las celdas. Con este protocolo obligaremos a las celdas a implementar los métodos para pintarse y para obtener una instancia de la celda.
``` swift
protocol cellDrawerProtocol {
  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell
  func drawCell(cell: UITableViewCell , withItem item: MainTableItemProtocol)
}
```
El método con el que se obtiene una instancia de la celda será siempre el mismo para todas las celdas así que implementamos una extension para no tener que repetir código.
``` swift
extension cellDrawerProtocol {
    func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell  {
        return tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
    }
}
``` 
También declaramos el protocolo que implementaran los objetos que utiliza la tabla para obtener la información. 
``` swift
protocol MainTableItemProtocol{
  var type: MainTableItemType { get }
}
```
El tipo **MainTableItemType** es una enumeración en la cual están incluidos todos los tipos de celdas. 
Utilizaremos el array de **allvalues** vamos a registrar todos los tipos de celda.
**idCell** servirá para crear un id único para cada celda para recuperarla con el **dequeueReusable**, y ademas registrarla por lo que tiene que tener el mismo nombre que el .xib.
Recuperaremos una instancia de la celda a través de **cellType**.
 
``` swift
enum MainTableItemType {
  
  case userInformation
  case userPicture
  
  static let allValues = [userInformation, userPicture]
  
  var idCell: String {
    switch self {
    case.userInformation:
      return String("ATableViewCell")
    case.userPicture:
      return String("BTableViewCell")
    }
  }
  
  var cellType: cellDrawerProtocol{
    switch self {
    case.userInformation:
      return ATableViewCell()
    case.userPicture:
      return BTableViewCell()
    }
  }
}
```
Declaramos un *ViewModel* por cada tipo de celda, y este implementara el **MainTableItemProtocol**, esto obligara a que implementemos el **type** de la celda que manejara este *ViewModel*. Este *ViewModel* tendrá un inicializador con las variables que utilizara la celda.

``` swift
class UserInformationVM: MainTableItemProtocol {
  
  var type: MainTableItemType{
    return .userInformation
  }
  
  var title: String
  var value: String
  
  init(title: String, value: String){
    self.title = title
    self.value = value
  }
}
```
Las celdas implementaran el protocolo **cellDrawerProtocol** que les obligara a implementar la lógica para pintarse con la información provista por el **ViewModel** que se responsabilizara de esa celda.
Casteamos el **item** al tipo de *ViewModel* correspondiente y utilizamos su información. 
``` swift
class ATableViewCell: UITableViewCell, cellDrawerProtocol {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblValue: UILabel!
  
  //Protocol Methods
  func drawCell(cell: UITableViewCell, withItem item: MainTableItemProtocol) {
    if let cell = cell as? ATableViewCell, let item = item as? UserInformationVM {
      cell.lblTitle.text = item.title
      cell.lblValue.text = item.value
    }
  }
}
```
El *ViewModel* principal de la tabla generaremos un array de **MainTableItemProtocol**
Inicializara el *ViewModel* responsable de cada celda con la información que utilizara la celda, y lo añadirá al array de items.

``` swift
class MainTableViewVM: NSObject {
  
  private var items = [MainTableItemProtocol]()
  
  var getItems: [MainTableItemProtocol] {
    return items
  }
  
  override init() {
    super.init()
    //Cargamos en data la información del archivo dataExample.
    //Utilizamos el modelo (profile) para obtener la información de data.
    guard let data = dataFromFile("dataExample"), let profile = MainTableModel(data: data) else { return }
    
    if let imgURL = profile.profilePicture {
      let imgURLVM = UserPictureVM(imgURL: imgURL)
      items.append(imgURLVM)
    }
    
    if let name = profile.nombre {
      let nameVM = UserInformationVM(title: "Nombre", value: name)
      items.append(nameVM)
    }
    if let apellidos = profile.apellidos {
      let apellidosVM = UserInformationVM(title: "Apellidos", value: apellidos)
      items.append(apellidosVM)
    }
  }
}
```
Por ultimo en el **viewDidLoad** del **TableViewController** registraremos todos los posibles tipos de celda que va a poder utilizar la tabla, para esto se utilizara el array **allvalues** como se menciono previamente.

``` swift
  func registerCells() {
    for cellType in MainTableItemType.allValues{
      let nib = UINib(nibName: cellType.idCell, bundle: nil)
      self.tableView.register(nib, forCellReuseIdentifier: cellType.idCell)
    }
  }
```
También es necesario declarar los siguientes métodos para conformar el protocolo **UITableViewDataSource**. De la manera en la que hemos implementado el *PatronStrategy* indicamos que solo utilizaremos una sección y que el numero de celdas será igual a la longitud del array de **items** del *ViewModel* principal. 

En el **cellForRowAt** obtenemos la instancia de la celda a través del **cellForTableView** (declarado previamente en la extension del protocolo). Y después llamamos a la función **drawCell** que es la responsable de gestionar la información que presentara la celda.
``` swift
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = viewModel.getItems[indexPath.row]
    let cell = item.type.cellType.cellForTableView(tableView, cellForRowAt: indexPath, idCell: item.type.idCell)
    item.type.cellType.drawCell(cell: cell, withItem: item)
    return cell
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getItems.count
  }
```
