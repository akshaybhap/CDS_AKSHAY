@EndUserText.label: 'Flight Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED


define root view entity ZC_FLIGHT_DETAIL_ABC 
provider contract transactional_query
as projection on ZI_FLIGHT_DETAIL_ABC
{

@UI:{
     lineItem: [{ position: 10,importance: #HIGH }],
     selectionField: [ { position: 10 } ]
}   
    key CarrierId,
    
    @UI.lineItem: [{ position:20 }]
    key ConnectionId,
    @UI.lineItem: [{ position:30 }]
    key FlightDate,
    @UI.lineItem: [{ position:40 }]
    Price,
    @UI.lineItem: [{ position:50 }]
    CurrencyCode,
    @UI.lineItem: [{ position:60 }]
    PlaneTypeId,
    @UI.lineItem: [{ position:70 }]
    SeatsMax,
    SeatsOccupied,
    AmountInCurrency,
    Status,
//    AmountInTargetCurrency,
    /* Associations */
    _Currency
}
