
class apb_test extends uvm_test;
  
  `uvm_component_utils(apb_test)
  
  apb_master_sequence m_seq;
  apb_env env_h;
  
  apb_env_config e_cfg;
  
  
  extern function new(string name="apb_test",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
      extern function void connect_phase(uvm_phase phase);
        extern task run_phase(uvm_phase phase);
      
    
    
endclass    
    
  
    function apb_test::new(string name="apb_test",uvm_component parent);
      super.new(name,parent);
    endfunction
    
    
    function void apb_test::build_phase(uvm_phase phase);
      super.build_phase(phase);
      m_seq=apb_master_sequence::type_id::create("m_seq");
      env_h=apb_env::type_id::create("env_h",this);
      e_cfg=apb_env_config::type_id::create("env_cfg");
      
      uvm_config_db #(apb_env_config)::set(this,"*","e_cfg",e_cfg);
      
      
    endfunction
    
    
    function void apb_test::connect_phase(uvm_phase phase);
      super.connect_phase(phase);
    endfunction
    
    task apb_test::run_phase(uvm_phase phase);
     //super.run_phase(phase);
      
      phase.raise_objection(this);
      m_seq.start(env_h.magt.m_seqr);
      phase.drop_objection(this);
      
      
      
    endtask
