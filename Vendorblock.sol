pragma solidity ^0.8.6;

contract VendorBlockTest {
    struct Vendor{
        uint VendorID;
        string VendorName;
        string DeliveryDate;
        string VendorLocation;
        string PurchaseOrder;
        uint DeliveryDateDay; 
        uint DeliveryDateTime;
        uint ExpectedDateDay; 
        uint ExpectedDateTime;
        string DeliveryStatus;
    }

    Vendor[] public vendors;
    uint public nextID;
    //uint256 public transactionID;
    
    
    function create(string memory VendorName, string memory DeliveryDate, string memory VendorLocation, uint DeliveryDateDay, uint DeliveryDateTime, uint ExpectedDateDay,  uint ExpectedDateTime,
        string memory PurchaseOrder,
        string memory DeliveryStatus
        ) public {
            
            if (DeliveryDateDay > ExpectedDateDay){
                revert("Gone past expected Date Time contact the Pharmacy"); 
                
            } 
            
            if(DeliveryDateTime > ExpectedDateTime + 2)
            {
                revert("Gone past expect time, please contact Pharmacy");
                
            }
            
            
            else {    vendors.push(
                Vendor(nextID,VendorName,DeliveryDate,VendorLocation,PurchaseOrder,DeliveryDateDay, DeliveryDateTime, ExpectedDateDay, ExpectedDateTime ,DeliveryStatus)
                );
                nextID++;
        }
        }
        
         function read(uint256 VendorID)
        public view returns(uint256,
                            string memory VendorName,
                            string memory DeliveryDate,
                            string memory VendorLocation,
                            string memory PurchaseOrder,
                            string memory DeliveryStatus,
                            uint256 DeliveryDateDay,
                            uint256 DeliveryDateTime,
                            uint256 ExpectedDateDay, 
                            uint256 ExpectedDateTime
                            )
    {
        uint256 i = find(VendorID);
        return (
            vendors[i].VendorID,
            vendors[i].VendorName,
            vendors[i].DeliveryDate,
            vendors[i].VendorLocation,
            vendors[i].PurchaseOrder,
            vendors[i].DeliveryStatus,
            vendors[i].DeliveryDateDay,
            vendors[i].DeliveryDateTime,
            vendors[i].ExpectedDateDay,
            vendors[i].ExpectedDateTime
            
            );    }
    
    function update(uint VendorID, string memory VendorName, string memory DeliveryDate, string memory VendorLocation, string memory PurchaseOrder, string memory DeliveryStatus)
   public {
        
        
         uint i = find(VendorID);
        
            vendors[i].VendorID;
            vendors[i].VendorName;
            vendors[i].DeliveryDate;
            vendors[i].VendorLocation;
            vendors[i].PurchaseOrder;
            vendors[i].DeliveryStatus;
        
    }
    
        
    
     
    function find(uint VendorID) view internal returns(uint) {
        for(uint i = 0; i < vendors.length; i++)
        {
            if(vendors[i].VendorID == VendorID)
            {
                return i; 
            }
        }
        revert('VendorID doesnt exist');
    }
        
        
  
    
}  
  
  
