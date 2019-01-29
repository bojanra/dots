" Vim syntax file
" Language:	IVG command set
" Maintainer:	Bojan Ramšak <bojan.ramsak@ozrtv.si>	
" Last Change:	2007 Aug 27

syn keyword ivgCommand 		add_ecmg add_emm_server add_pid add_program add_server alloc_pid generate_psi_si get_file port_bandwidth psi_si put_file remove_file reset_all save set_emm_output sntp_enable sntp_poll_interval sntp_servers start_psi_si_transmit start_scramble_program stop_file_transmit time_zone cet 

syn keyword ivgPath 		system clock cas config interface output scrambling xconnect filesystem playout descriptors show 

syn keyword ivgKey 		emm unreferenced clear_ca edit pat nit sdt pmt eit tdt tot cat

syn match hexNumber		"0[xX][0-9a-fA-F]\+"

syn match descriptor 		"[0-9a-fA-F]\+:[0-9a-fA-F]\+"

if version >= 508 || !exists("did_ivg_syn_inits")
  if version < 508
    let did_ivg_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ivgCommand		Label
  HiLink hexNumber		Number
  HiLink ivgPath		Statement
  HiLink ivgKey			String
"  HiLink basicComment		Comment
  HiLink descriptor		Special

  delcommand HiLink
 endif

let b:current_syntax = "cfg"

" vim: ts=8
