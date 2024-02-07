namespace com.ajay.electronics;
using {managed,cuid} from '@sap/cds/common';

@assert.unique:{
    business_partner_number:[business_partner_number]
    

}

entity Business_Partner : cuid, managed {
    key ID:UUID;
    @title:'Business Partner Number'
    business_partner_number:String(3) @mandatory;
    @title:'Name'
    name:String(20) @mandatory;
    @title:'Address1'
    address1:String(20) @mandatory;
    @title:'Address2'
    address2:String(20) @mandatory;
    @title:'City'
    city:String(20) @mandatory;
    @title:'State'
    state:String(2) @mandatory;
    @title:'Pincode'
    pincode:String(6) @mandatory;
    @title:'GSTIN Number'
    GSTIN_Number:String(15) @mandatory;
    @title:'Is GSTN Registered'
    is_gstn_registered:Boolean @mandatory;
    @title:'Is Vendor'
    is_vendor:Boolean ;
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

entity Store:cuid,managed{
    key ID:UUID;
    @title:'Store ID'
    store_id:String(10) @mandatory;
    @title:'Name'
    name:String(20) @mandatory;
    @title:'Address1'
    address1:String(20) @mandatory;
    @title:'Address22'
    address2:String(20) @mandatory;
    @title:'State'
    state:String(2) @mandatory;
    @title:'Pin Code'
    pincode:String(6) @mandatory;

}

entity Product : cuid,managed{

    key ID:UUID;
    @title:'Product ID'
    key product_id:String(10) @mandatory;
    @title:'Product_Name'
    product_name:String(20) @mandatory;
    @title:'Product Image URL'
    product_image_url:String(100) @mandatory;
    @title:'product Cost Price'
    prodct_cost_price:String(10) @mandatory;
    @title:'product Sell Price'
    prodct_sell_price:String(10) @mandatory;
    

}




entity Stockdata : cuid,managed{
    key ID:UUID;
    @title:'store id'
    store_id:String(10);
    @title:'Product id'
    product_id:String(10);
    @title:'Stock quantity'
    stock_qty:String(10);
}



entity Purchase : cuid,managed{
    key ID: UUID;
    @title:'Purchase Order Number'
    key purchase_order_number:String(10);
    @title:'BusinessPartner'
    business_partner:String(20);
    @title:'Purchase Order Entity'
    purchase_order_date:Date;
    
    



}













