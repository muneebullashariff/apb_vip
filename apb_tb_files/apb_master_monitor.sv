/////////////////////////////////////MASTER_MONITOR//////////////////////////////////////////////////////


`ifndef apb_master_moniotor_sv
`define apb_master_monitor_sv

class apb_master_monitor extends uvm_monitor;
  
  `uvm_component_utils(apb_master_monitor)
     
      virtual apb_if vif;
     
    apb_transaction apb_trans;
    
  uvm_analysis_port #(apb_transaction) mon2sb;
     
     extern function new(string name="monitor",uvm_component parent); 
     extern function void build_phase(uvm_phase phase);
     extern function void connect_phase(uvm_phase phase);
     extern task run_phase(uvm_phase phase);
     //extern task drive2dut()  
      
   endclass
    
    
       function apb_master_monitor:: new(string name="monitor",uvm_component parent);
        super.new(name,parent);
    endfunction
      
       function void apb_master_monitor:: build_phase(uvm_phase phase);
         super.build_phase(phase);
         
         apb_trans=apb_transaction::type_id::create("apb_trans");
         
         if(!uvm_config_db # (virtual apb_if)::get(this,"","vif",vif))
           `uvm_fatal(get_type_name(),$sformatf("not able to get interface in driver"))
         
    endfunction
           
           
       function void apb_master_monitor::connect_phase(uvm_phase phase);
         super.connect_phase(phase);
       endfunction
        
    
       task apb_master_monitor::run_phase(uvm_phase phase);
         super.run_phase(phase);
         forever
           begin
         
         
         @(vif.mmon_cb.paddr or vif.mmon_cb.pwdata or vif.mmon_cb.psel or vif.mmon_cb.pwrite or vif.mmon_cb.psel or vif.mmon_cb.pready or vif.mmon_cb.prdata);
         apb_trans.paddr=vif.mmon_cb.paddr;
         apb_trans.pwrite=vif.mmon_cb.pwrite;
         apb_trans.pwdata=vif.mmon_cb.pwdata;
         apb_trans.psel=vif.mmon_cb.psel;
        
         wait(vif.mmon_cb.penable);
         wait(vif.mmon_cb.pready);
         
         apb_trans.penable=vif.mmon_cb.penable;
         apb_trans.pready=vif.mmon_cb.pready;
         
         if(apb_trans.pwrite==0)
           apb_trans.prdata=vif.mmon_cb.prdata;
         
         if(apb_trans.penable && apb_trans.pready)
           mon2sb.write(apb_trans);
         
           end
         endtask
    
`endif
