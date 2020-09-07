/////////////////////////////////////MASTER_DRIVER////////////////////////////////////////////////////////////////

`ifndef apb_master_driver_sv
`define apb_master_driver_sv

class apb_master_driver extends uvm_driver #(apb_transaction);
          
  `uvm_component_utils(apb_master_driver)
     
      virtual apb_if vif;
      apb_transaction req;
     
     
     extern function new(string name="driver",uvm_component parent); 
     extern function void build_phase(uvm_phase phase);
     extern function void connect_phase(uvm_phase phase);
     extern task run_phase(uvm_phase phase);
     extern task drive2dut(); 
      
 endclass
    
    
       function apb_master_driver:: new(string name="driver",uvm_component parent);
        super.new(name,parent);
    endfunction
      
       function void apb_master_driver:: build_phase(uvm_phase phase);
         super.build_phase(phase);
         
          req=apb_transaction::type_id::create("req");
         
         if(!uvm_config_db # (virtual apb_if)::get(this,"","vif",vif))
           `uvm_fatal(get_type_name(),$sformatf("not able to get interface in driver"))
         
    endfunction
           
           
       function void apb_master_driver::connect_phase(uvm_phase phase);
         super.connect_phase(phase);
       endfunction
        
    
       task apb_master_driver::run_phase(uvm_phase phase);
         super.run_phase(phase);
      
        
         
         seq_item_port.get_next_item(req);
         drive2dut();
         seq_item_port.item_done(rsp);
         
       endtask
       
         
    task apb_master_driver::drive2dut();
      
      @(vif.mdrv_cb);
      vif.mdrv_cb.paddr<=req.paddr;
      vif.mdrv_cb.pwrite<=req.pwrite;
      vif.mdrv_cb.pwdata<=req.pwdata;
      vif.mdrv_cb.psel<=req.psel;
    //  vif.mdrv_cb.pread<=1'b0;
      
      
     // wait(req.penable)
      @(vif.mdrv_cb);
      vif.mdrv_cb.penable<=1'b1;
    
      
    //checks for the condition untill pready is low  
      if(req.pwrite)
        begin
          do 
            begin
            @(vif.mdrv_cb);
          
            end
          while(!vif.mdrv_cb.pready);
          
       vif.mdrv_cb.penable<=1'b0;
          
        end 
           // end
            
          
          
      if(!req.pwrite)
        begin
         do
           begin
           @(vif.mdrv_cb);
           end
         while(!vif.mdrv_cb.pready);
          
            vif.mdrv_cb.penable<=1'b0;
          
        end
      
    endtask    
    
         
`endif
