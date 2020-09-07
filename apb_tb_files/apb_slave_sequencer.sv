`ifndef apb_slave_sequencer_sv
`define apb_slave_sequencer_sv

class apb_slave_sequencer extends uvm_sequencer #(apb_transaction);
      
  `uvm_component_utils(apb_slave_sequencer)
      
      
      extern function new(string name="seqr",uvm_component parent);
       
      
    endclass
    
    
    function apb_slave_sequencer:: new(string name="seqr",uvm_component parent);
        super.new(name,parent);
    endfunction
      
    
`endif
