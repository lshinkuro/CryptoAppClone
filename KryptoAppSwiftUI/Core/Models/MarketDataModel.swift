//
//  MarketDataModel.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 07/12/22.
//

import Foundation

/*
 
 URL: https://api.coingecko.com/api/v3/global
 {
   "data": {
     "active_cryptocurrencies": 13091,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 611,
     "total_market_cap": {
       "btc": 52261170.12823851,
       "eth": 705526379.90166,
       "ltc": 11093706293.603056,
       "bch": 7940116810.658731,
       "bnb": 3078886787.8981977,
       "eos": 923412296767.4337,
       "xrp": 2288087515908.638,
       "xlm": 10377684739674.252,
       "link": 126556801568.76648,
       "dot": 162908540094.64627,
       "yfi": 125114326.23710088,
       "usd": 888929452999.4796,
       "aed": 3265024546925.2993,
       "ars": 150674608998755.75,
       "aud": 1328174385751.2078,
       "bdt": 92174189253672.9,
       "bhd": 335124625921.8986,
       "bmd": 888929452999.4796,
       "brl": 4654079044124.085,
       "cad": 1213682938993.235,
       "chf": 837712004706.0122,
       "clp": 781591221549795.5,
       "cny": 6203394187756.874,
       "czk": 20658321358383.562,
       "dkk": 6318053642181.454,
       "eur": 849471652439.7393,
       "gbp": 732999670860.4822,
       "hkd": 6919826880401.805,
       "huf": 349316448641955.8,
       "idr": 13878769289744624,
       "ils": 3056785711124.5474,
       "inr": 73374896727500.52,
       "jpy": 122075160342102.7,
       "krw": 1173196408823280.2,
       "kwd": 272974234285.98688,
       "lkr": 328099613797182,
       "mmk": 1874815811277903.2,
       "mxn": 17600358704663.23,
       "myr": 3916623169915.7144,
       "ngn": 395404709988699.2,
       "nok": 8909533675780.693,
       "nzd": 1405666810816.4407,
       "php": 49324917488035.25,
       "pkr": 200462749402607.72,
       "pln": 3984653829883.2183,
       "rub": 56104780648203.266,
       "sar": 3342211180258.698,
       "sek": 9264012962682.752,
       "sgd": 1207735112023.2148,
       "thb": 31121420149511.848,
       "try": 16562622461231.629,
       "twd": 27253243634784.617,
       "uah": 32971345455194.95,
       "vef": 89008506128.83807,
       "vnd": 21212993153023060,
       "zar": 15418659148166.6,
       "xdr": 671139959155.7014,
       "xag": 39844511539.679344,
       "xau": 501569554.56042767,
       "bits": 52261170128238.51,
       "sats": 5226117012823851
     },
     "total_volume": {
       "btc": 2440850.6264322107,
       "eth": 32951510.693728518,
       "ltc": 518129997.65890735,
       "bch": 370842042.8338107,
       "bnb": 143798975.922556,
       "eos": 43127841904.21583,
       "xrp": 106864806754.86479,
       "xlm": 484688311333.1405,
       "link": 5910817680.323388,
       "dot": 7608620533.475545,
       "yfi": 5843447.072120979,
       "usd": 41517325518.80684,
       "aed": 152492513870.695,
       "ars": 7037236496228.398,
       "aud": 62032198542.76388,
       "bdt": 4304982590872.8047,
       "bhd": 15651948685.939177,
       "bmd": 41517325518.80684,
       "brl": 217368109486.2655,
       "cad": 56684891567.91818,
       "chf": 39125221774.389915,
       "clp": 36504108462411.055,
       "cny": 289728656132.9938,
       "czk": 964844003777.9155,
       "dkk": 295083809882.3621,
       "eur": 39674454473.67807,
       "gbp": 34234646897.57639,
       "hkd": 323189544634.87616,
       "huf": 16314775777094.361,
       "idr": 648205974566897.9,
       "ils": 142766748229.31036,
       "inr": 3426964268160.273,
       "jpy": 5701503254934.432,
       "krw": 54793973850520.88,
       "kwd": 12749223354.966272,
       "lkr": 15323846479210.299,
       "mmk": 87563009710148.73,
       "mxn": 822022286609.6176,
       "myr": 182925336235.86325,
       "ngn": 18467321564020.5,
       "nok": 416118521655.48083,
       "nzd": 65651471394.86602,
       "php": 2303713358387.5596,
       "pkr": 9362584615978.45,
       "pln": 186102698675.1431,
       "rub": 2620365917084.8433,
       "sar": 156097504762.81857,
       "sek": 432674427069.9411,
       "sgd": 56407099142.8718,
       "thb": 1453521566413.4304,
       "try": 773554960798.962,
       "twd": 1272858924418.3428,
       "uah": 1539922068548.1804,
       "vef": 4157129804.1981373,
       "vnd": 990749872209257,
       "zar": 720126314588.8096,
       "xdr": 31345497732.04814,
       "xag": 1860932327.249248,
       "xau": 23425735.750731632,
       "bits": 2440850626432.2104,
       "sats": 244085062643221.06
     },
     "market_cap_percentage": {
       "btc": 36.78929873330802,
       "eth": 17.092635308732554,
       "usdt": 7.391016265373807,
       "bnb": 5.3019316489713555,
       "usdc": 4.832717928100512,
       "busd": 2.482801072711931,
       "xrp": 2.198298079217751,
       "doge": 1.5522625635503795,
       "ada": 1.2533184140452376,
       "matic": 0.9024654669918922
     },
     "market_cap_change_percentage_24h_usd": 0.03376484228079939,
     "updated_at": 1670393300
   }
 }
 
 */

// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketDataModel
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: {$0.key == "usd"}) {
            return item.value.formatUsingAbbrevation()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: {$0.key == "usd"}) {
            return item.value.formatUsingAbbrevation()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.formatUsingAbbrevation()
        }
        return ""
    }
}


