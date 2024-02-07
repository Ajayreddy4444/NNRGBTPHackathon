using {com.ajay.electronics as db} from '../db/schema';

service MASTERDATA {
    entity Business_Partner as projection on db.Business_Partner{
        @UI.Hidden : true
        ID,
        *
    };
    entity States as projection on db.States{
        @UI.Hidden : true
        ID,
        *
    };
}

    annotate MASTERDATA.Business_Partner with @odata.draft.enabled;

    annotate MASTERDATA.Business_Partner with {
    name      @assert.format: '^[a-zA-Z]{2,}$';
    city     @assert.format: '^[a-zA-Z]{2,}$';  
    pincode  @assert.format: '^[1-9]{6,}$';
    GSTIN_Number @assert.format: '^[0-9]]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}Z[0-9A-Z]{1}$'
    
    }

    annotate MASTERDATA.Business_Partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
        {
            $Type : 'UI.DataField',
            Value : GSTIN_Number
        },
        {
            $Type : 'UI.DataField',
            Value : is_gstn_registered
        },
        {
            $Type : 'UI.DataField',
            Value : is_vendor
        },
                {
            $Type : 'UI.DataField',
            Value : is_customer
        },
        
    ],
    UI.SelectionFields: [ business_partner_number , name,address1,address2,city],
);

annotate MASTERDATA.States with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        },
    ],
    UI.SelectionFields: [ code,description],
);


annotate MASTERDATA.Business_Partner with @(
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
        {
            $Type : 'UI.DataField',
            Value : GSTIN_Number
        },
        {
            $Type : 'UI.DataField',
            Value : is_gstn_registered
        },
        {
            $Type : 'UI.DataField',
            Value : is_vendor
        },
                {
            $Type : 'UI.DataField',
            Value : is_customer
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'Business Partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
    ],
);

annotate MASTERDATA.Business_Partner with {
    state @(
        Common.ValueListWithFixedValues:true,
        Common.ValueList: {
            Label :'States',
            CollectionPath:'States',
            Parameters : [

               
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty:state,
                    ValueListProperty:'code'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty:'description'
                }

            ]
        }
    );

}
