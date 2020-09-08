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
//  ###########################################################################

`ifndef APB_SLAVE_SEQUENCE_SV
`define APB_SLAVE_SEQUENCE_SV

//-----------------------------------------------------------------------------
// Class : APB Slave Sequence
// Description of the class: APB Slave Sequence class contains sequences
// FILE NAME: apb_slave_sequence.sv
//-----------------------------------------------------------------------------

class apb_slave_sequence extends uvm_sequence #(apb_transaction);

// Registering with UVM Factory
  `uvm_object_utils(apb_slave_sequence)

//=======================methods===================================
  extern function new(string name = "apb_slave_sequence");

  endclass

//========================constructor=============================
  function apb_slave_sequence::new(string name = "apb_slave_sequence");
    super.new(name);
  endfunction

//*******************************************************
//SEQUENCES
//*******************************************************

class slave_seqs1 extends apb_slave_sequence;
  `uvm_object_utils(slave_seqs1)

   extern function new(string name ="slave_seqs1");
   extern task body();

  endclass

function slave_seqs1::new(string name = "slave_seqs1");
  super.new(name);
endfunction

task slave_seqs1::body();
  req = apb_transaction::type_id::create("req");
  start_item(req);
  assert(req.randomize());
//  `uvm_info("slave FIRST SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH)
  finish_item(req);
endtask

`endif

