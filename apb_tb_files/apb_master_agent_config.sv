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
