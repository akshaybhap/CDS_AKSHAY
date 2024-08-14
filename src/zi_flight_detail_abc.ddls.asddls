@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight details view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@AbapCatalog.extensibility: {
    extensible: true,
    elementSuffix: 'ZTR',
    quota: {
        maximumFields: 1000,
        maximumBytes: 10000
    },
    dataSources: [ 'TRAVEL' ]

}
define root view entity ZI_FLIGHT_DETAIL_ABC 
//with parameters
//  @Consumption.defaultValue: 'USD'
//   TargetCurrency : abap.cuky
  as select from /dmo/flight as TRAVEL
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency

{
  key carrier_id                                           as CarrierId,
  key connection_id                                        as ConnectionId,
  key flight_date                                          as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                                                as Price,
      currency_code                                        as CurrencyCode,
      plane_type_id                                        as PlaneTypeId,
      seats_max                                            as SeatsMax,
      seats_occupied                                       as SeatsOccupied,

      concat(cast(price as abap.char( 20 )),currency_code) as AmountInCurrency,

      //      case

      case
      when seats_occupied < 50 then '1'
      when seats_occupied < 150 then '2'
      when seats_occupied < 250 then '3'
      else '0'
      end                                                  as Status,

//      //      currency conversion
//      @Semantics.amount.currencyCode: 'CurrencyCode'
//      currency_conversion( amount => TRAVEL.price,
//      source_currency => currency_code,
////      target_currency => cast('EUR'as abap.cuky),
//      target_currency => $parameters.TargetCurrency,
////      exchange_rate_date => $session.system_date )         as AmountInTargetCurrency,
//      exchange_rate_date => '20220101' )         as AmountInTargetCurrency,


      //      public association
      _Currency
}
