pragma solidity ^0.8.6;

contract VendorBlockTest {
    struct Vendor{
        uint VendorID;
        string VendorName;
        string DeliveryDate;
        string VendorLocation;
        string PurchaseOrder;
        string DeliveryStatus;
        //uint256 TransactionID;
    }

    Vendor[] public vendors;
    uint public nextID;
    //uint256 public transactionID;
    
    
    function create(string memory VendorName, string memory DeliveryDate, string memory VendorLocation,
        string memory PurchaseOrder,
        string memory DeliveryStatus
        ) public {
            vendors.push(
                Vendor(nextID,VendorName,DeliveryDate,VendorLocation,PurchaseOrder,DeliveryStatus)
                );
                nextID++;
        }
        
         function read(uint256 VendorID)
        public view returns(uint256,
                            string memory VendorName,
                            string memory DeliveryDate,
                            string memory VendorLocation,
                            string memory PurchaseOrder,
                            string memory DeliveryStatus
                            )
    {
        uint256 i = find(VendorID);
        return(
            vendors[i].VendorID,
            vendors[i].VendorName,
            vendors[i].DeliveryDate,
            vendors[i].VendorLocation,
            vendors[i].PurchaseOrder,
            vendors[i].DeliveryStatus
            );
            
        //update vendor deatails
    }
    
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
  