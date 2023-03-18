//
//  AppConstants.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import Foundation
import UIKit

struct AppConstants {
  // MARK: - URL's
  var baseUrl: String { "https://private-5acf0e-feedbapp.apiary-mock.com" }
  var calendarEndpoint = "/events"
  var ticketsEndpoint = "/tickets"
  var commentsEndpoint = "/comments"
  
  // MARK: Contract screen
  var newContractCardCornerRadius: CGFloat { 10.0 }
  var newContractCardShadowColor: CGColor { UIColor.black.cgColor }
  var newContractCardShadowOpacity: Float { 0.3 }
  var newContractCardShadowOffset: CGSize { .zero }
  var newContractCardShadowRadius: CGFloat { 5.0 }
  var ticketCellReusableID: String { "ticketCellReusableID" }
  var expiredTicketImageName: String { "ticket_expired" }
  var okTicketImageName: String { "ticket_ok" }
  var ticketCellNib: String { "TicketTableViewCell" }
  var segueContractFlow: String { "contract_flow" }
  var newContractOneToSecondStepSegue: String { "new_contract_one_to_two" }
  var newContractSecondToThirdStepSegue: String { "new_contract_two_to_three" }
  var newContractThirdToFourthStepSegue: String { "new_contract_three_to_four" }
  var newContractToFinalStepSegue: String { "new_contract_to_final" }
  
  // MARK: - Alerts
  var genericIssueAlertTitle: String { "¡Oops!" }
  var genericSuccessfulAlertTitle: String { "¡Genial!" }
  var genericOkActionTitle: String { "Muy bien" }
  var notForNowActionTitle: String { "No por ahora"}
  var emptyFieldsAlertMessage: String { "Asegúrate de que todos los campos estén llenos antes de continuar" }
  var successfulSignInAlertTitle: String { "¡Registro exitoso!" }
  var successfulSignInAlertMessage: String { "Ahora ya puedes realizar el inicio de sesión con tu correo y contraseña que introdujiste"}
  var successfulLogInAlertTitle: String { "¡Sesión iniciada!" }
  var successfulLogInAlertMessage: String { "Ahora ya puedes acceder a todo el contenido en la parte de contrataciones. ¿Quieres ir ahí?"}
  var emptyEmailFieldAlertMessage: String { "Introduce el correo electrónico de la cuenta que quieres recuperar" }
  var successfullySentRecoveryMailAlertMessage: String { "Se ha enviado un correo de recuperación para tu contraseña olvidada" }
  var takeMeThereActionTitle: String { "¡Vamos!" }
  var LogInActionTitle: String { "Iniciar sesión" }
  var unableLoadContentUnlessLogedInAlertMessage: String { "Para poder acceder al contenido completo de este apartado debes iniciar sesión." }
  var successfullyLogedOutAlertMessage: String { "Sesión cerrada exitosamente" }
  
  // MARK: - Calendar
  var calendarCellReusableID: String { "calendarCellReusableID" }
  var januaryNumber: Int { 1 }
  var februaryNumber: Int { 2 }
  var marchNumber: Int { 3 }
  var aprilNumber: Int { 4 }
  var mayNumber: Int { 5 }
  var juneNumber: Int { 6 }
  var julyNumber: Int { 7 }
  var augustNumber: Int { 8 }
  var septemberNumber: Int { 9 }
  var octoberNumber: Int { 10 }
  var novemberNumber: Int { 11 }
  var decemberNumber: Int { 12 }

  var januaryString: String { "ENE" }
  var februaryString: String { "FEB" }
  var marchString: String { "MAR" }
  var aprilString: String { "ABR" }
  var mayString: String { "MAY" }
  var juneString: String { "JUN" }
  var julyString: String { "JUL" }
  var augustString: String { "AGO" }
  var septemberString: String { "SEP" }
  var octoberString: String { "OCT" }
  var novemberString: String { "NOV" }
  var decemberString: String { "DIC" }
  
  // MARK: - Map
  var mxCityLattitude: Double { 19.445724627294464 }
  var mxCityLongitude: Double { -99.13744228386442 }
  var defaultMapRegionLatitudinalMeters: Double { 5000.0 }
  var defaultMapRegionLongitudinalMeters: Double { 5000.0 }

  // MARK: - Misc
  var tenMinutes: Int { 10 }
  var doubleZeroString: String { "00" }
  var maximumSetNumberToShow: Int { 5 }
  var numberOfSetsPickerComponents: Int { 1 }
  var setsPickerRowsHeight: CGFloat { 30.0 }
  var setsPickerValues: [Int] { [1,2,3,4,5] }
  var setsPickerDefaultSelectedRow: Int { 1 }
  var animationReadyName: String { "ready" }
  var animationApprovedName: String { "approved" }
  var defaultAnimationSpeed: CGFloat { 1.0 }
  var contractsTabBarControllerIndex: Int { 2 }
  var profileTabBarControllerIndex: Int { 3 }
  
  // MARK: - Long strings
  var newContractNextStepInstructions: String {
"""
¡Hemos recibido tu solicitud!
            
A partir de ahora tendrás 3 días para realizar la transferencia de apartado para que tu evento quede formalmente agendado. Esto lo podrás hacer accediendo al ticket generado en el apartado de contrataciones.
Una vez que recibamos la notificación de transferencia, en tu ticket aparecerá el sello de confirmado.
       
¡Agradecemos mucho tu preferencia, nos vemos en el show!
🎸🥁🎤
             
"""
  }
}
