let s:extfname = expand("%:e")
"echom 's:extfname = ' . s:extfname
if s:extfname =~? "f90" || s:extfname == ""
  let b:fortran_free_source=1
  let b:fortran_fixed_source=0
  let b:fortran_do_enddo=1
endif

"setl foldmethod=syntax
