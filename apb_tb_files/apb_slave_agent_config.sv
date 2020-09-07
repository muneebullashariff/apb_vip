// FILE NAME: apb_slave_agent_config.sv
//-----------------------------------------------------------------------------------------------------------------------------

`ifndef apb_slave_agent_config
`define apb_slave_agent_config

`include "apb_if.sv"



class apb_slave_agent_config extends uvm_object;
  `uvm_object_utils(apb_slave_agent_config)//Facatory registration
  virtual apb_if vif; 
  uvm_active_passive_enum is_active=UVM_ACTIVE;
  extern function new(string name="apb_slave_agent_config");
endclass:apb_slave_agent_config
    
// Constructor 
  function apb_slave_agent_config::new(string name = "apb_slave_agent_config");
    super.new(name);
  endfunction:new
    
    
    
 `endif   
