pragma solidity ^0.8.6;


contract PharmacyBlock {
    struct pharmacy{
        uint StoreID;
        string StoreLocation;
        string DrugBrandID;
        string Brandname;
        string Purchasedate;
        string Purchaseorder;
        string Drugrecivedate;
        string Orderstatus;
        string TrackingID;
        string DrugInventoryamount;
        
    }

    pharmacy[] public Bpharmacy;
    uint public nextID;
    
    
    
    function create(string memory StoreLocation, 
    string memory DrugBrandID, 
    string memory Brandname,
    string memory Purchasedate, 
    string memory Purchaseorder,
    string memory Drugrecivedate,
    string memory Orderstatus,
    string memory TrackingID,
    string memory DrugInventoryamount) 
    public {
             Bpharmacy.push(pharmacy(nextID,StoreLocation,DrugBrandID,Brandname,Purchasedate,Purchaseorder,Drugrecivedate,Orderstatus,TrackingID,DrugInventoryamount)
                );
                nextID++;
        }
        
         function read(uint256 StoreID)
        public view returns(uint256,
                            string memory StoreLocation, 
                            string memory DrugBrandID, 
                            string memory Brandname,
                            string memory Purchasedate, 
                            string memory Purchaseorder,
                            string memory Drugrecivedate,
                            string memory Orderstatus,
                            string memory TrackingID,
                            string memory DrugInventoryamount
                            )
    {
        uint256 i = find(StoreID);
        return(
            Bpharmacy[i].StoreID,
            Bpharmacy[i].StoreLocation,
            Bpharmacy[i].DrugBrandID,
            Bpharmacy[i].Brandname,
            Bpharmacy[i].Purchasedate,
            Bpharmacy[i].Purchaseorder,
            Bpharmacy[i].Drugrecivedate,
            Bpharmacy[i].Orderstatus,
            Bpharmacy[i].TrackingID,
             Bpharmacy[i].DrugInventoryamount
            );
            
       
    }
    
    function update(uint256 StoreID, string memory StoreLocation, string memory DrugBrandID, string memory Brandname,string memory Purchasedate, string memory Purchaseorder,string memory Drugrecivedate,string memory Orderstatus,string memory TrackingID,string memory DrugInventoryamount)
   public {
        
        
         uint256 i = find(StoreID);
            Bpharmacy[i].StoreLocation=StoreLocation;
            Bpharmacy[i].DrugBrandID=DrugBrandID;
            Bpharmacy[i].Brandname=Brandname;
            Bpharmacy[i].Purchasedate=Purchasedate;
            Bpharmacy[i].Purchaseorder=Purchaseorder;
            Bpharmacy[i].Drugrecivedate=Drugrecivedate;
            Bpharmacy[i].Orderstatus=Orderstatus;
            Bpharmacy[i].TrackingID=TrackingID;
            Bpharmacy[i].DrugInventoryamount=DrugInventoryamount;
        
    }
    function destroy(uint256 StoreID) public {
        uint256 i = find(StoreID);
        delete Bpharmacy[i];
    }
        
    
     
    function find(uint256 StoreID) view internal returns(uint256) {
        for(uint256 i = 0; i < Bpharmacy.length; i++)
        {
            if(Bpharmacy[i].StoreID == StoreID)
            {
                return i; 
            }
        }
        revert('StoreID doesnt exist');
    }
        
        
  
    
}  
  