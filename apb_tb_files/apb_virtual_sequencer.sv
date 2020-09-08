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
////////////////////////////////virtual_sequencer////////////////////////////////////

`ifndef apb_virtual_sequencer_sv
`define apb_virtual_sequencer_sv

class apb_virtual_sequencer extends uvm_sequencer;
  
  `uvm_component_utils(apb_virtual_sequencer)
  

 
  
  
  
  extern function new(string name="v_seqr",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);    
  
 endclass
  
    
    function apb_virtual_sequencer::new(string name="v_seqr",uvm_component parent);
      super.new(name,parent);
    endfunction
    
    
    function void apb_virtual_sequencer::build_phase(uvm_phase phase);
      super.build_phase(phase);
    
    endfunction
  
    
    `endif  

//////////////////////////////////virtual_sequence//////////////////////////////////////
