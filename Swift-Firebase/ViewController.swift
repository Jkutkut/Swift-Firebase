//
//  ViewController.swift
//  Swift-Firebase
//
//  Created by Usuario invitado on 1/3/23.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var txtfExpediente: UITextField!
    @IBOutlet weak var txtfNombre: UITextField!
    @IBOutlet weak var txtfEmail: UITextField!
    
    private let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onBtnAlmacenar(_ sender: Any) {
        let key: String = txtfExpediente.text!
        let user: String = txtfNombre.text ?? ""
        let email: String = txtfEmail.text ?? ""

        db.collection("usuarios")
            .document(key)
            .setData([
                "usuario": user,
                "email": email
            ])
    }
    
    @IBAction func onBtnRecuperar(_ sender: Any) {
        let key: String = txtfExpediente.text!
        db.collection("usuarios").document(key)
            .getDocument{ (document: DocumentSnapshot?, e: Error?) in
                self.txtfNombre.text = document?.get("usuario") as? String
                self.txtfEmail.text = document?.get("email") as? String
            }
    }

    @IBAction func onBtnEliminar(_ sender: Any) {
        let key: String = txtfExpediente.text!
        db.collection("usuarios").document(key)
            .delete()
    }
}

