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

