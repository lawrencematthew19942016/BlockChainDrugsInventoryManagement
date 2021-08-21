pragma solidity ^0.8.6;


contract DrugBlockTest{
    struct Drug {
        
        uint drugId; 
        string drugName; 
        string brandName;
        string ExpiryDate;
        //whole numbers only
        uint UnitPrice;
        uint SalesPrice;
        bool DrugDelivered; 
        
        //uint TrackingID;
        
    }
    
    Drug[] public drugs; 
    uint public nextId;
    uint public trackingID; 

    
    function create(string memory drugName, string memory brandName, string memory ExpiryDate, uint UnitPrice, uint SalesPrice, bool DrugDelivered) public {
        drugs.push(Drug(nextId, drugName, brandName, ExpiryDate, UnitPrice, SalesPrice, DrugDelivered)); 
        nextId++; 
        if(DrugDelivered == false)
        { 
            revert("Error");
        }
    }
    
    function read(uint drugId) view public returns(uint, string memory, string memory, string memory ExpiryDate, uint UnitPrice, uint SalesPrice, bool DrugDelivered)
    {
        uint i = find(drugId);
       
            return(drugs[i].drugId, drugs[i].drugName, drugs[i].brandName, drugs[i].ExpiryDate, drugs[i].UnitPrice, drugs[i].SalesPrice, drugs[i].DrugDelivered); 
      
    }
    
    //to-do need updateBrand
    function update(uint drugId, string memory drugName, string memory brandName, string memory ExpiryDate, uint UnitPrice, uint SalesPrice, bool DrugDelivered) public
    {
        uint i = find(drugId);
             drugs[i].drugName = drugName; 
             drugs[i].brandName = brandName; 
             drugs[i].ExpiryDate = ExpiryDate;
             drugs[i].UnitPrice = UnitPrice;
             drugs[i].SalesPrice = SalesPrice;
             drugs[i].DrugDelivered = DrugDelivered;
         
     
    }
    
    
    function destroy(uint drugId) public {
        uint i = find(drugId);
        delete drugs[i];
        
    }
    
    function find(uint drugId) view internal returns(uint) {
        for(uint i = 0; i < drugs.length; i++)
        {
            if(drugs[i].drugId == drugId)
            {
                return i; 
            }
        }
        revert('Drug does not exist');
    }
    
        
    
    
}


// contract Pharmacy{
    
//     struct PharmDrug
    
//     {
//         uint drugId; 
//         string drugName; 
//         string brandName;
//         string ExpiryDate;
//         //whole numbers only
//         uint UnitPrice;
//         uint SalesPrice;
//     }
    
    
    
    
// }
