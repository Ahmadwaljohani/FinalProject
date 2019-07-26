//
//  ViewController.swift
//  VirtualTourist
//
//  Created by Ahmad on 24/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//


import UIKit
import MapKit
import CoreData

class MapVC: UIViewController, MKMapViewDelegate, NSFetchedResultsControllerDelegate {
    
    // MARK : OUTLET
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var fetchedResultsController: NSFetchedResultsController<Pin>!
    
    var context: NSManagedObjectContext {
        return DataController.instance.viewContext
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.delegate = self
        setupFetchedResultsController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchedResultsController = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CheckInternetConnection.Connection() == false {
            alerts(errorMessage: "No Internet Connection")
        }
    }
    
    
    func setupFetchedResultsController() {
        let fetchRequest: NSFetchRequest<Pin> = Pin.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "createdDate", ascending: false),
        ]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            updateMapView()
            
        } catch {
            fatalError("fetch not performd: \(error.localizedDescription)")
        }
    }
    
    @IBAction func LongPeess(_ sender: UILongPressGestureRecognizer) {
        if sender.state != .began { return }
        let touchPoint = sender.location(in: mapView)
        
        let pin = Pin(context: context)
        pin.cord = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        try? context.save()
    }
    
    func updateMapView() {
        guard let pins = fetchedResultsController.fetchedObjects else { return }
        
        for pin in pins {
            if mapView.annotations.contains(where: { pin.comparison(to: $0.coordinate) }) { continue }
            let annotation = MKPointAnnotation()
            annotation.coordinate = pin.cord
            mapView.addAnnotation(annotation)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollection" {
            let PhotosVC = segue.destination as! PhotosVC
            PhotosVC.pin = sender as? Pin
        }
    }
    
    // MARK: MKMapViewDelegate
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let pin = fetchedResultsController.fetchedObjects?.filter {
            $0.comparison(to: view.annotation!.coordinate)
            }.first!
        performSegue(withIdentifier: "toCollection", sender: pin)
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        updateMapView()
    }
    
    
    
}


