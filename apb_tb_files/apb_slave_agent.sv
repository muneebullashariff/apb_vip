//  ###########################################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//  ###########################################################################
// FILE NAME: apb_slave_agent.sv	
//-----------------------------------------------------------------------------------------------------------------------------


`ifndef apb_slave_agent_sv
`define apb_slave_agent_sv

class apb_slave_agent extends uvm_agent;
  `uvm_component_utils(apb_slave_agent)//Facatory registration
  
  apb_slave_sequencer apb_s_sequencer_h;
  apb_slave_driver apb_s_driver_h;//Declaring apb_driver handle
  apb_slave_monitor apb_s_monitor_h;//Declaring apb_monitor handle
  
 // apb_slave_agent_config apb_slave_agent_config_h;//Declaring apb_agent_config handle
  
   apb_slave_agent_config scfg;
  
  extern function new(string name = "apb_slave_agent",uvm_component parent);
  extern function void build_phase(uvm_phase phase); 
  extern function void connect_phase(uvm_phase phase);
endclass:apb_slave_agent
    
// Constructor   
  function apb_slave_agent::new (string name="apb_slave_agent",uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
//Build_phase  
  function void apb_slave_agent:: build_phase(uvm_phase phase);
    super.build_phase(phase);
       
    if(!uvm_config_db #(apb_slave_agent_config)::get(this," ","scfg",scfg))
      begin
      `uvm_fatal("CONFIG","cannot get the value from uvm_config_db")
      end
     
    scfg=apb_slave_agent_config::type_id::create("scfg");
    
     if(scfg.is_active==UVM_ACTIVE)
      begin
        apb_s_driver_h=apb_slave_driver::type_id::create("apb_s_driver_h",this);//Creating object for apb_driver handle
        
        apb_s_sequencer_h=apb_slave_sequencer::type_id::create("apb_s_sequencer_h",this);   
        
      end
    apb_s_monitor_h=apb_slave_monitor::type_id::create("apb_s_monitor_h",this);//Creating object for apb_monitor handle
  endfunction:build_phase

  
    function void apb_slave_agent::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      
      apb_s_driver_h.seq_item_port.connect(apb_s_sequencer_h.seq_item_export);
    
    
    endfunction
    
    `endif  
