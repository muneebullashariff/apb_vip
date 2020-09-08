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
//////////////////////////////////MASTER_SEQUENCER////////////////////////////////////////////////
`ifndef apb_master_sequencer_sv
`define apb_master_sequencer_sv

class apb_master_sequencer extends uvm_sequencer #(apb_transaction);
      
      `uvm_component_utils(apb_master_sequencer)
      
      
      extern function new(string name="seqr",uvm_component parent);
       
      
    endclass
    
    
    function apb_master_sequencer:: new(string name="seqr",uvm_component parent);
        super.new(name,parent);
    endfunction
      
    
`endif

