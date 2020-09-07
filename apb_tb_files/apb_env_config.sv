`ifndef APB_ENV_CONFIG_SV
`define APB_ENV_CONFIG_SV

//-----------------------------------------------------------------------------
// Class : APB Environment Configuration
// Description of the class : Contains configuration variables for setting up the environment
// FILE NAME: apb_env_config.sv	
//-----------------------------------------------------------------------------

class apb_env_config extends uvm_object;

// Registering with UVM Factory
  `uvm_object_utils(apb_env_config)

  apb_master_agent_config mcfg;
  apb_slave_agent_config scfg;

  bit has_magt=1;
  bit has_sagt=1;
  bit has_virtual_sequencer=1;
  bit has_scoreboard=1;

//=======================methods===================================
  extern function new(string name = "apb_env_config");

  endclass

//========================constructor=============================
function apb_env_config::new(string name = "apb_env_config");
  super.new(name);
endfunction

`endif

