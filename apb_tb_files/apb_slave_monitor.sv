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
// FILE NAME: apb_slave_monitor.sv	
//-----------------------------------------------------------------------------------------------------------------------------


`ifndef apb_slave_monitor_sv
`define apb_slave_monitor_sv

class apb_slave_monitor extends uvm_monitor;
  
  `uvm_component_utils(apb_slave_monitor)
		 
// uvm_analysis_port #(apb_slave_trans) slave_mon_ap;
  
  uvm_analysis_port #(apb_transaction) slave_mon_ap; 
  
  
  int num_of_slave_packets_sampled;


		function new(string name = "apb_slave_monitor",uvm_component parent);
			super.new(name,parent);
          slave_mon_ap = new("slave_mon_ap",this);
		endfunction

		//virtual apb_interface vif;
        
        virtual apb_if vif;
  

		function void build_phase(uvm_phase phase);
			super.build_phase(phase);

          if(!uvm_config_db #(virtual apb_if)::get(this,"","vif",vif))
				`uvm_fatal(get_full_name(),"NO VIRTUAL INTERFACE HANDLE RECEIVED")

		endfunction

              
		function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
		endfunction
  

	  task monitor();
			//apb_slave_trans trans_h;
            apb_transaction trans_h;
			trans_h = apb_transaction::type_id::create("trans_h");

			@(vif.smon_cb.psel or vif.smon_cb.pwrite or vif.smon_cb.penable or
			  vif.smon_cb.pready or vif.smon_cb.prdata);

			trans_h.psel	= vif.smon_cb.psel;

			wait(vif.smon_cb.penable);
			trans_h.penable	= vif.smon_cb.penable;
			
			wait(vif.smon_cb.pready);
			trans_h.paddr	= vif.smon_cb.paddr;
			trans_h.pwdata	= vif.smon_cb.pwdata;
			trans_h.pwrite	= vif.smon_cb.pwrite;
			trans_h.pready	= vif.smon_cb.pready;
			trans_h.prdata	= vif.smon_cb.prdata;
			//trans_h.presetn	<= vif.smon_cb.presetn;
			if(trans_h.pready) begin

				if(trans_h.pwrite)
				`uvm_info(get_full_name(),$sformatf("Write Op,from MASter to SLAVE,Sampled data,%p",trans_h.sprint()),UVM_HIGH)
				else if(trans_h.pwrite == 'b0)
				`uvm_info(get_full_name(),$sformatf("Read Op,from MASter to SLAVE,Sampled data,%p",trans_h.sprint()),UVM_HIGH)
				slave_mon_ap.write(trans_h);
				num_of_slave_packets_sampled++;
			end
		endtask

		task run_phase(uvm_phase  phase);
			forever monitor;
		endtask

		function void report_phase(uvm_phase  phase);
			super.report_phase(phase);
			`uvm_info(get_full_name(),$sformatf("num_of_slave_packets_sampled %d",num_of_slave_packets_sampled),UVM_HIGH)
		endfunction

	endclass


`endif
