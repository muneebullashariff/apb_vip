//  ###########################################################################

`ifndef APB_MASTER_SEQUENCE_SV
`define APB_MASTER_SEQUENCE_SV

//-----------------------------------------------------------------------------
// Class : APB Master Sequence
// Description of the class: APB Master Sequence class contains sequences
// FILE NAME: apb_master_sequence.sv
//-----------------------------------------------------------------------------

class apb_master_sequence extends uvm_sequence #(apb_transaction);

// Registering with UVM Factory
  `uvm_object_utils(apb_master_sequence)

//=======================methods===================================
  extern function new(string name = "apb_master_sequence");
    
    extern task body();

  endclass

//========================constructor=============================
  function apb_master_sequence::new(string name = "apb_master_sequence");
    super.new(name);
  endfunction
      
      
  task apb_master_sequence::body();
    
 
    `uvm_do_with(req,{req.paddr==10;req.pwdata==100;req.pwrite==1;})    
    `uvm_info(get_type_name(),$sformatf("addr=%0d,write=%b,wdata=%0d",req.paddr,req.pwrite,req.pwdata),UVM_LOW)
    
    
  
    
    
    
    
  endtask    
      

//*******************************************************
//SEQUENCES
//*******************************************************

class master_seqs1 extends apb_master_sequence;
  `uvm_object_utils(master_seqs1)

   extern function new(string name ="master_seqs1");
   extern task body();

  endclass

function master_seqs1::new(string name = "master_seqs1");
  super.new(name);
endfunction

task master_seqs1::body();
  req = apb_transaction::type_id::create("req");
  start_item(req);
  assert(req.randomize());
//  `uvm_info("MASTER FIRST SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH)
  finish_item(req);
endtask

`endif

