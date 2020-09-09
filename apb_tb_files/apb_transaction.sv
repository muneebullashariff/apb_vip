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

`ifndef APB_TRANSACTION_SV
`define APB_TRANSACTION_SV

//-----------------------------------------------------------------------------
// Class : APB Transaction
// Description of the class: APB Transaction class contains all the signals declaration
// FILE NAME: apb_transaction.sv	
//-----------------------------------------------------------------------------

class apb_transaction extends uvm_sequence_item;

// Registering with UVM Factory
  `uvm_object_utils(apb_transaction)

//=====================Data Members====================

  rand bit psel;
  rand bit penable;
  rand bit pwrite;
  rand bit [31:0] paddr;
  rand bit [31:0] pwdata;
       bit [31:0] prdata;
       bit pready;

// Registering class and class fileds with uvm factory

  /*
  `uvm_object_utils_begin(apb_transaction)
  `uvm_field_int(psel,UVM_ALL_ON)
  `uvm_field_int(penable,UVM_ALL_ON)
  `uvm_field_int(pwrite,UVM_ALL_ON)
  `uvm_field_int(paddr,UVM_ALL_ON)
  `uvm_field_int(pwdata,UVM_ALL_ON)
  `uvm_field_int(prdata,UVM_ALL_ON)
  `uvm_field_int(pready,UVM_ALL_ON) //vk
  `uvm_object_utils_end
*/
//=======================methods===================================
  extern function new(string name = "apb_transaction");

  endclass

//========================constructor=============================
function apb_transaction::new(string name ="apb_transaction");
  super.new(name);
endfunction

    `endif
