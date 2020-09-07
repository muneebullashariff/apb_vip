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
