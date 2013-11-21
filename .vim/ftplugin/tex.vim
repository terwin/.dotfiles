" let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction=nonstopmode $*'
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_ViewRule_pdf = 'kpdf'
" let g:Tex_UseMakefile = 0
" let g:Tex_MultipleCompileFormats = 'dvi,pdf'

let g:LatexBox_quickfix=2
if !empty(v:servername)
  let g:LatexBox_latexmk_async=1
endif

set suffixesadd=.tex

set conceallevel=0
