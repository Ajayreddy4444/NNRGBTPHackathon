namespace com.ajay.electronics;
using {managed,cuid} from '@sap/cds/common';

@assert.unique:{
    business_partner_number:[business_partner_number]
}

entity Business_Partner : cuid, managed {
    key ID:UUID;
    @title:'Business Partner Number'
    business_partner_number:String(3);
    @title:'Name'
    name:String(20);
    @title:'Address1'
    address1:String(20);
    @title:'Address2'
    address2:String(20);
    @title:'City'
    city:String(20);
    @title:'State'
    state:String(2);
    @title:'Pincode'
    pincode:String(6);
    @title:'GSTIN Number'
    GSTIN_Number:String(15);
    @title:'Is GSTN Registered'
    is_gstn_registered:Boolean;
    @title:'Is Vendor'
    is_vendor:Boolean;
    @title:'Is Customer'
    is_customer:Boolean;
}


@cds.persistence.skip
entity States: cuid,managed{
    key ID:UUID;
    @title:'code'
    key code: String(2);
    @title:'description'
    description:String(10);
    
}








