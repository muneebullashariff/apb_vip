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

