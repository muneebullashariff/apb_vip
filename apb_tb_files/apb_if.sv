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
`define addr_width 8

`ifndef apb_if_sv
`define apb_if_sv


interface apb_if(input bit pclk,prstn);
  //logic pclk;
  //logic prst;
  logic pwrite;
  logic pread;
  logic pready;
  logic [`addr_width-1:0] pwdata;
  logic psel;
  logic pslverr;
  logic [`addr_width-1:0] prdata;
  logic penable;
  logic paddr;
 
  clocking mdrv_cb@(posedge pclk);
    output pwrite;
    output pread;
    output pwdata;
    output psel;
    output pslverr;
    output penable;
    output paddr; 
   input  prdata;
    input pready;    
  endclocking
  
  clocking mmon_cb@(posedge pclk);
    input pwrite;
    input pread;
    input pwdata;
    input prdata;
    input psel;
    input penable;
    input pslverr;
    input paddr;
    input pready;
    
  endclocking
 
  
  clocking sdrv_cb@(posedge pclk);
    input pwrite;
   input  pread;
    input  pwdata;
    input  psel;
    input  pslverr;
    input  penable;
   input  paddr; 
   output  prdata;
   output pready;
    
  endclocking  
  
  clocking smon_cb@(posedge pclk);
    input pwrite;
    input pread;
    input pwdata;
    input prdata;
    input psel;
    input penable;
    input pslverr;
    input paddr;
    input pready;
    
  endclocking
 
  
  
  
  
    modport mdrv_mp(clocking mdrv_cb,input pclk,prstn);
    modport mmon_mp(clocking mmon_cb,input pclk,prstn);
    
    
   
    modport sdrv_mp(clocking sdrv_cb,input pclk,prstn);
    modport smon_mp(clocking smon_cb,input pclk,prstn);  
  

    
endinterface    

      `endif    
      
