using {com.ajay.electronics as db} from '../db/schema';
service TRANSACTIONALDATA {
    entity Stockdata as projection on db.Stockdata{
        @UI.Hidden : true
        ID,
        *
    };
}
annotate TRANSACTIONALDATA.Stockdata with @odata.draft.enabled;

annotate TRANSACTIONALDATA.Stockdata with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : stockqty
        },
        
        
    ],
UI.FieldGroup #StockData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
        ],
},
UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'Store Information',
            Target : '@UI.FieldGroup#StockData',
        },
    ],


);
