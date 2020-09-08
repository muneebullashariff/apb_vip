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
`ifndef APB_ENV_SV
`define APB_ENV_SV

`include "apb_virtual_sequencer.sv"
`include "apb_scoreboard.sv"


//-----------------------------------------------------------------------------
// Class : APB Environment
// Description of the class : Setting up the environment
// FILE NAME: apb_env.sv	
//-----------------------------------------------------------------------------

class apb_env extends uvm_env;

// Registering with UVM Factory
  `uvm_component_utils(apb_env)

//=================apb master and slave handles===================
  apb_master_agent magt;
  apb_slave_agent sagt;

//=================virtual sequencer declaration===================
  apb_virtual_sequencer v_seqr;

//==================apb scoreboard declaration====================
  apb_scoreboard sb;

//==================apb environment config handle=================
  apb_env_config e_cfg;

//==================apb master agent config handle=================
  apb_master_agent_config mcfg;

//==================apb slave agent config handle=================
  apb_slave_agent_config scfg;

//=======================methods===================================
  extern function new(string name = "apb_env",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

  endclass

//========================constructor=============================
function apb_env::new(string name = "apb_env",uvm_component parent);
  super.new(name,parent);
endfunction

//========================Build_phase=============================
function void apb_env::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if(!uvm_config_db #(apb_env_config)::get(this,"","e_cfg",e_cfg))
    `uvm_fatal(get_full_name,"NOT GETTING FROM ENV")

  if(e_cfg.has_magt) begin
    $display("in mcfg env");
   // mcfg=apb_master_agent_config::type_id::create("mcfg",this);
    uvm_config_db #(apb_master_agent_config)::set(this,"*","mcfg",e_cfg.mcfg);
    magt = apb_master_agent::type_id::create("magt",this);
  end

  if(e_cfg.has_sagt) begin
    $display("in scfg env");
   // scfg=apb_slave_agent_config::type_id::create("scfg",this);
    uvm_config_db #(apb_slave_agent_config)::set(this,"*","scfg",e_cfg.scfg);
    sagt = apb_slave_agent::type_id::create("sagt",this);
  end

  if(e_cfg.has_scoreboard) begin
    sb = apb_scoreboard::type_id::create("sb",this);
  end

  if(e_cfg.has_virtual_sequencer) begin
    v_seqr = apb_virtual_sequencer::type_id::create("v_seqr",this);
  end
endfunction

//========================Connect_phase()===============
function void apb_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(e_cfg.has_virtual_sequencer) begin
    if(e_cfg.has_magt)
//      v_seqr.m_seqr = magt.mseqr;

    if(e_cfg.has_sagt)
//      v_seqr.s_seqr = sagt.sseqr;

    if(e_cfg.has_scoreboard) begin
 //     magt.mmon.mmon_ap.connect(sb.m_fifo.analysis_export);
 //     sagt.smon.smon_ap.connect(sb.s_fifo.analysis_export);
    end
  end
endfunction

`endif

