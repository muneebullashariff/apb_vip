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
///////////////////apb_scoreboard///////////////////////////////////////  

`ifndef apb_scoreboard_sv
`define apb_scoreboard_sv

class apb_scoreboard extends uvm_scoreboard;   

  `uvm_component_utils(apb_scoreboard)
  
//  uvm_analysis_imp #(master_trans,master_sb) sb2mon;
  
  
  //external function
  extern function new(string name="apb_sb",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
    
  //extern write function
 //   extern function void write (master_trans m_trans); 
  
 endclass
  
 
     
    function apb_scoreboard::new(string name="apb_sb",uvm_component parent);
  super.new(name,parent);
 // sb2mon=new("sb2mon",this);
endfunction
    
 
 function void apb_scoreboard::build_phase(uvm_phase phase);
   super.build_phase(phase);
   
 endfunction
    
    
 function void apb_scoreboard::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  
 endfunction
   
/*    
 ///add the function     
 function void master_sb::write(master_trans m_trans);
        
 endfunction 
  */
      
     
 task apb_scoreboard::run_phase(uvm_phase phase);
    super.run_phase(phase);
  
 endtask
   
    `endif  
    
 ///////////////////apb_sb///////////////////////////////////////   
    
