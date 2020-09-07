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

