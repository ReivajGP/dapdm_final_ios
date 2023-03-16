//
//  ContractViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit

final class ContractViewController: UIViewController {
  
  // MARK: - Properties
  private let constants: AppConstants = AppConstants()
  private var tickets: [TicketItem] = []
  
  // MARK: - IBOutlets
  @IBOutlet private weak var newContractView: UIView!
  @IBOutlet private weak var ticketsTableView: UITableView!
  @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    ticketsTableView.register(UINib(nibName: constants.ticketCellNib, bundle: nil), forCellReuseIdentifier: constants.ticketCellReusableID)
    setupView()
    setupNewContractTap()
    loadUserTickets()
  }
  
  // MARK: - Private methods
  private func setupView() {
    setupContractCardView()
  }

  private func loadUserTickets() {
    activityIndicator.startAnimating()
    guard let ticketsURL: URL = URL(string: constants.baseUrl + constants.ticketsEndpoint) else { return }
    let ticketsRequest: URLRequest = URLRequest(url: ticketsURL)
    URLSession.shared.dataTask(with: ticketsRequest, completionHandler: { ticketsData, _, error in
      if error == nil {
        guard let ticketsData,
              let tickets: [TicketItem] = try? JSONDecoder().decode([TicketItem].self, from: ticketsData) else { return }
        self.tickets = tickets
        self.stopActivityIndicator()
        DispatchQueue.main.async {
          self.ticketsTableView.reloadData()
        }
      } else {
        // TODO: Mostrar alerta de que hubo un error al traer los tickets
      }
    }).resume()
  }
  
  private func setupContractCardView() {
    newContractView.layer.cornerRadius = constants.newContractCardCornerRadius
    newContractView.layer.shadowColor = constants.newContractCardShadowColor
    newContractView.layer.shadowOpacity = constants.newContractCardShadowOpacity
    newContractView.layer.shadowOffset = constants.newContractCardShadowOffset
    newContractView.layer.shadowRadius = constants.newContractCardShadowRadius
  }
  
  private func setupNewContractTap() {
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToNewContractFlow))
    newContractView.addGestureRecognizer(tapGesture)
  }
  
  private func stopActivityIndicator() {
    DispatchQueue.main.async {
      self.activityIndicator.hidesWhenStopped = true
      self.activityIndicator.stopAnimating()
    }
  }

  
  @objc private func goToNewContractFlow() {
    print ("VAMO A ENTRAR A EL FLUJO DE CONTRATO")
  }
}

// MARK: - TableView extension
extension ContractViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tickets.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let ticketCell: TicketTableViewCell = tableView.dequeueReusableCell(withIdentifier: constants.ticketCellReusableID, for: indexPath) as! TicketTableViewCell
    ticketCell.numberLabel.text = tickets[indexPath.row].ticketNumber
    ticketCell.dateLabel.text = tickets[indexPath.row].eventDate
    ticketCell.timeLabel.text = tickets[indexPath.row].eventTime
    if tickets[indexPath.row].ticketStatus == .zero {
      ticketCell.sealImageView.isHidden = false
      ticketCell.ticketImageView.image = UIImage(named: constants.expiredTicketImageName)
    } else {
      ticketCell.sealImageView.isHidden = true
      ticketCell.ticketImageView.image = UIImage(named: constants.okTicketImageName)
    }
    return ticketCell
  }
}
