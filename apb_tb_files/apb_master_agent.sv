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
///////////////////////////////////////////MASTER_AGENT///////////////////////////////////////////////////////////////


`ifndef apb_master_agent_sv
`define apb_master_agent_sv

`include "apb_master_agent_config.sv"

class apb_master_agent extends uvm_agent;
 
  `uvm_component_utils(apb_master_agent)
   
   apb_master_sequencer m_seqr;
   apb_master_driver m_drv;
   apb_master_monitor m_mon;
   
  apb_master_agent_config mcfg;
   
   extern function new (string name="master_agent",uvm_component parent);
   extern function void build_phase(uvm_phase phase);  
   extern function void connect_phase(uvm_phase phase);
   
       
 endclass    
 
     
     function apb_master_agent:: new (string name="master_agent",uvm_component parent);
       super.new(name,parent);
     endfunction
   
     
     
     function void apb_master_agent::build_phase(uvm_phase phase);
       super.build_phase(phase);
     /*  
       m_seqr=apb_master_sequencer::type_id::create("master_seqr",this);
       m_drv=apb_master_driver::type_id::create("master_drv",this);
       m_mon=apb_master_monitor::type_id::create("master_mon",this);
     */
     
       if(!uvm_config_db #(apb_master_agent_config)::get(this," ","mcfg",mcfg))
      begin
      `uvm_fatal("CONFIG","cannot get the value from uvm_config_db")
      end
     
       mcfg=apb_master_agent_config::type_id::create("mcfg");
    
       if(mcfg.is_active==UVM_ACTIVE)
      begin
       m_seqr=apb_master_sequencer::type_id::create("master_seqr",this);
       m_drv=apb_master_driver::type_id::create("master_drv",this);
      end
        m_mon=apb_master_monitor::type_id::create("master_mon",this);
    
     
     endfunction
     
     
     function void apb_master_agent::connect_phase(uvm_phase phase);
       super.connect_phase(phase);
       
       m_drv.seq_item_port.connect(m_seqr.seq_item_export);
       
       
     endfunction
       
`endif
