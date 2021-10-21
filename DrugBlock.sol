pragma solidity ^0.8.6;



contract DrugBlockTest{
    struct Drug {
        
        uint drugId; 
        string drugName; 
        string brandName;
        uint Dday;
        uint Dmonth;
        uint Dyear; 
        uint eDay;
        uint eMonth;
        uint eYear; 
        uint drugCount;
        bool DrugDelivered; 
   
    }
    
    Drug[] public drugs; 
    uint public nextId;
    uint public trackingID; 


    function create(string memory drugName, string memory brandName, 
    uint Dday, uint Dmonth, uint Dyear, 
    uint eDay, uint eMonth, uint eYear, uint drugCount,
    bool DrugDelivered) public {
        
        
        if(drugCount <= 3){
            revert('Drug stock too low, please restock');
        }
       
        if(DrugDelivered == false)
        { 
            revert("Error");
        }
        //alternative to the error function 
        if(Dyear == eYear) {
            if(Dmonth == eMonth)
            if(Dday >= eDay){
                revert("This drug has expired, please discard");
            }
            
         if(Dyear >= eYear) {
            if(Dmonth == eMonth)
            if(Dday >= eDay){
                revert("This drug has expired, please discard");
            }
            
        }
        
        if(Dyear >= eYear) {
            if(Dmonth >= eMonth)
            if(Dday >= eDay){
                revert("This drug has expired, please discard");
            }
            
        }
    } else {
        
    drugs.push(Drug(nextId, drugName, brandName, Dday, Dmonth, Dyear, eDay, eMonth, eYear, drugCount,DrugDelivered)); 
        nextId++;
       
   }
   }  
    
    // function expiryDrug() public{
        
    // }
    
    function read(uint drugId) view public returns(uint, string memory, string memory, 
    uint Dday, uint Dmonth, uint Dyear, 
    uint eDay, uint eMonth, uint eYear, uint drugCount,
   bool DrugDelivered)
    {
        uint i = find(drugId);
       
            return(drugs[i].drugId, drugs[i].drugName, drugs[i].brandName, drugs[i].Dday, drugs[i].Dmonth, drugs[i].Dyear, drugs[i].eDay, drugs[i].eMonth, drugs[i].eYear,
             drugs[i].drugCount, drugs[i].DrugDelivered); 
      
    }
    
    //to-do need updateBrand
    function update(uint drugId, string memory drugName, string memory brandName, 
    uint Dday, uint Dmonth, uint Dyear, 
    uint eDay, uint eMonth, uint eYear,uint drugCount,
  bool DrugDelivered) public
    {
        uint i = find(drugId);
             drugs[i].drugName = drugName; 
             drugs[i].brandName = brandName; 
             drugs[i].Dday = Dday; 
             drugs[i].Dmonth = Dmonth; 
             drugs[i].Dyear = Dyear; 
             drugs[i].eDay = eDay; 
             drugs[i].eMonth = eMonth; 
             drugs[i].eYear = eYear; 
             drugs[i].drugName = drugName;
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



