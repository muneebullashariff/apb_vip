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
//-----------------------------------------------------------------------------------------------------------------------------
// FILE NAME: apb_slave_driver.sv	
//-----------------------------------------------------------------------------------------------------------------------------
`ifndef apb_slave_driver_sv
`define apb_slave_driver_sv


`include "apb_master_agent_config.sv"
`include "apb_slave_agent_config.sv"

class apb_slave_driver extends uvm_driver#(apb_transaction);
  `uvm_component_utils(apb_slave_driver)//Facatory registration
  //Decalaring virtual interface
  virtual apb_if vif;
  apb_master_agent_config apb_master_agent_config_h;//Declaring apb_master_agent_config handle
  apb_slave_agent_config apb_slave_agent_config_h;//Declaring apb_slave_agent_config handle
  apb_transaction req;//Declaring apb_master_xtn handle
  int i;
// Constructor   
  function new(string name="apb_slave_driver",uvm_component parent=null);
    super.new(name,parent);
  endfunction:new

//Build_phase  
  function void build_phase(uvm_phase phase);
    super.build_phase (phase);
    
    
    if(!uvm_config_db #(virtual apb_if)::get(this,"","vif",vif))
				`uvm_fatal(get_full_name(),"NO VIRTUAL INTERFACE HANDLE RECEIVED")
    
    
    
  endfunction:build_phase
               
  task run_phase(uvm_phase phase);
    begin
      forever
        begin
          req=apb_transaction::type_id::create("req");
          seq_item_port.get_next_item(req);
          send_to_master(req);
          seq_item_port.item_done();
        end
    end
  endtask
  
  task send_to_master(input apb_transaction req);
    bit pready;
    bit penable;
    `uvm_info("Slave_Driver","Slave started to receive the data from master",UVM_LOW)
    get_slave_addr(req.psel);
    @(vif.sdrv_cb);
    //Received_r/w_bit
    req.penable=vif.pwdata;
    `uvm_info("Slave_Driver", $sformatf("Received_r/w_bit: %0d",req.penable),UVM_LOW)
    write_read();
  endtask:send_to_master
    
  //Getting slave address
  task get_slave_addr(input bit psel); 
    int i;
    @(vif.sdrv_cb);
    req.paddr[i]=vif.pwdata;      
    `uvm_info("Slave_Driver", $sformatf("Received slave Address: %0d",req.paddr),UVM_LOW)
  endtask : get_slave_addr      
            
  //writting data
  task get_write_data(input bit [7:0] data_temp);
    int i;
    for (int i=8;i>=0;i--) 
     begin                                                          
       @(vif.sdrv_cb); 
       data_temp[i]=vif.pwdata; 
       req.pwdata=data_temp;
     end
    `uvm_info("Slave_Driver", $sformatf("Receiving 8bit data from master:%0h",data_temp),UVM_LOW)  
    `uvm_info("Slave_Driver","Received data from master",UVM_LOW) 
    req.print();
 endtask: get_write_data 
  
  //Reading data
  task drive_read_data(input bit [7:0] data_temp);
    int i;
    for(int i = 8; i >= 0; i--) 
        begin
          @(vif.sdrv_cb);
          vif.pwdata=data_temp[i];
          req.pwdata=data_temp;
        end 
    `uvm_info("Slave_Driver", $sformatf("Sending 8bit data from slave: %0h",data_temp),UVM_LOW)    
   
    req.print();
  endtask: drive_read_data 
    
 task write_read();
   if (req.penable == 0)
     begin
       //calling the task write_data
       `uvm_info("Slave_Driver","Write_Data",UVM_LOW)
       get_write_data(req.pwdata);   
     end
   if (req.penable == 1) 
     begin
       //calling the task read_data 
       `uvm_info("Slave_Driver","Read_Data",UVM_LOW) 
       drive_read_data(req.pwdata); 
     end
  endtask:write_read
  
  
  //with pready condition
 /* 
  task ready_condition();
    begin
      if(pready==0);
        begin
          `uvm_info("Slave_Driver","Wait for more transfer",UVM_LOW)
          write_read();
        end
      else
        `uvm_info("Slave_Driver","No more transfer",UVM_LOW)
        end
  endtask*/
              
endclass:apb_slave_driver
