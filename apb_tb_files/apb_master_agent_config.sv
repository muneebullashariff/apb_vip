// FILE NAME: apb_master_agent_config.sv
//-----------------------------------------------------------------------------------------------------------------------------

`ifndef apb_master_agent_config_sv
`define apb_master_agent_config_sv

class apb_master_agent_config extends uvm_object;
  `uvm_object_utils(apb_master_agent_config)//Factory registration
  virtual apb_if vif; 
  uvm_active_passive_enum is_active=UVM_ACTIVE;
  extern function new(string name="apb_master_agent_config");
endclass:apb_master_agent_config
    
// Constructor 
    function apb_master_agent_config::new(string name = "apb_master_agent_config");
    super.new(name);
  endfunction:new
    
    
    `endif
