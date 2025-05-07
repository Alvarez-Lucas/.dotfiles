#################################################################################
# CONFIG
#################################################################################

use std/config light-theme

$env.config.show_banner = false
$env.config.history.file_format = "sqlite"
$env.config.rm.always_trash = true
$env.config.buffer_editor = "editor"
$env.config.buffer_editor = "nvim"
$env.config.completions.algorithm = "fuzzy"
$env.config.footer_mode = "never"
$env.config.table.mode = "light"
$env.config.table.index_mode = "auto"
$env.config.color_config = (light-theme)
# $env.config.color_config.binary      # Binary value
$env.config.completions.external.enable = true
$env.LS_COLORS = "*~=0;38;2;112;113;117:bd=0;38;2;2;138;155;48;2;112;113;117:ca=0:cd=0;38;2;195;57;155;48;2;112;113;117:di=0;38;2;99;119;182:do=0;38;2;44;46;51;48;2;195;57;155:ex=1;38;2;215;49;75:fi=0:ln=0;38;2;195;57;155:mh=0:mi=0;38;2;44;46;51;48;2;215;49;75:no=0:or=0;38;2;44;46;51;48;2;215;49;75:ow=0:pi=0;38;2;44;46;51;48;2;99;119;182:rs=0:sg=0:so=0;38;2;44;46;51;48;2;195;57;155:st=0:su=0:tw=0:*.1=0;38;2;145;119;42:*.a=1;38;2;215;49;75:*.c=0;38;2;75;139;90:*.d=0;38;2;75;139;90:*.h=0;38;2;75;139;90:*.m=0;38;2;75;139;90:*.o=0;38;2;112;113;117:*.p=0;38;2;75;139;90:*.r=0;38;2;75;139;90:*.t=0;38;2;75;139;90:*.v=0;38;2;75;139;90:*.z=4;38;2;2;138;155:*.7z=4;38;2;2;138;155:*.ai=0;38;2;195;57;155:*.as=0;38;2;75;139;90:*.bc=0;38;2;112;113;117:*.bz=4;38;2;2;138;155:*.cc=0;38;2;75;139;90:*.cp=0;38;2;75;139;90:*.cr=0;38;2;75;139;90:*.cs=0;38;2;75;139;90:*.db=4;38;2;2;138;155:*.di=0;38;2;75;139;90:*.el=0;38;2;75;139;90:*.ex=0;38;2;75;139;90:*.fs=0;38;2;75;139;90:*.go=0;38;2;75;139;90:*.gv=0;38;2;75;139;90:*.gz=4;38;2;2;138;155:*.ha=0;38;2;75;139;90:*.hh=0;38;2;75;139;90:*.hi=0;38;2;112;113;117:*.hs=0;38;2;75;139;90:*.jl=0;38;2;75;139;90:*.js=0;38;2;75;139;90:*.ko=1;38;2;215;49;75:*.kt=0;38;2;75;139;90:*.la=0;38;2;112;113;117:*.ll=0;38;2;75;139;90:*.lo=0;38;2;112;113;117:*.ma=0;38;2;195;57;155:*.mb=0;38;2;195;57;155:*.md=0;38;2;145;119;42:*.mk=0;38;2;75;139;90:*.ml=0;38;2;75;139;90:*.mn=0;38;2;75;139;90:*.nb=0;38;2;75;139;90:*.nu=0;38;2;75;139;90:*.pl=0;38;2;75;139;90:*.pm=0;38;2;75;139;90:*.pp=0;38;2;75;139;90:*.ps=0;38;2;215;49;75:*.py=0;38;2;75;139;90:*.rb=0;38;2;75;139;90:*.rm=0;38;2;195;57;155:*.rs=0;38;2;75;139;90:*.sh=0;38;2;75;139;90:*.so=1;38;2;215;49;75:*.td=0;38;2;75;139;90:*.ts=0;38;2;75;139;90:*.ui=0;38;2;145;119;42:*.vb=0;38;2;75;139;90:*.wv=0;38;2;195;57;155:*.xz=4;38;2;2;138;155:*FAQ=0;38;2;254;252;244;48;2;145;119;42:*.3ds=0;38;2;195;57;155:*.3fr=0;38;2;195;57;155:*.3mf=0;38;2;195;57;155:*.adb=0;38;2;75;139;90:*.ads=0;38;2;75;139;90:*.aif=0;38;2;195;57;155:*.amf=0;38;2;195;57;155:*.ape=0;38;2;195;57;155:*.apk=4;38;2;2;138;155:*.ari=0;38;2;195;57;155:*.arj=4;38;2;2;138;155:*.arw=0;38;2;195;57;155:*.asa=0;38;2;75;139;90:*.asm=0;38;2;75;139;90:*.aux=0;38;2;112;113;117:*.avi=0;38;2;195;57;155:*.awk=0;38;2;75;139;90:*.bag=4;38;2;2;138;155:*.bak=0;38;2;112;113;117:*.bat=1;38;2;215;49;75:*.bay=0;38;2;195;57;155:*.bbl=0;38;2;112;113;117:*.bcf=0;38;2;112;113;117:*.bib=0;38;2;145;119;42:*.bin=4;38;2;2;138;155:*.blg=0;38;2;112;113;117:*.bmp=0;38;2;195;57;155:*.bsh=0;38;2;75;139;90:*.bst=0;38;2;145;119;42:*.bz2=4;38;2;2;138;155:*.c++=0;38;2;75;139;90:*.cap=0;38;2;195;57;155:*.cfg=0;38;2;145;119;42:*.cgi=0;38;2;75;139;90:*.clj=0;38;2;75;139;90:*.com=1;38;2;215;49;75:*.cpp=0;38;2;75;139;90:*.cr2=0;38;2;195;57;155:*.cr3=0;38;2;195;57;155:*.crw=0;38;2;195;57;155:*.css=0;38;2;75;139;90:*.csv=0;38;2;145;119;42:*.csx=0;38;2;75;139;90:*.cxx=0;38;2;75;139;90:*.dae=0;38;2;195;57;155:*.dcr=0;38;2;195;57;155:*.dcs=0;38;2;195;57;155:*.deb=4;38;2;2;138;155:*.def=0;38;2;75;139;90:*.dll=1;38;2;215;49;75:*.dmg=4;38;2;2;138;155:*.dng=0;38;2;195;57;155:*.doc=0;38;2;215;49;75:*.dot=0;38;2;75;139;90:*.dox=0;38;2;75;139;90:*.dpr=0;38;2;75;139;90:*.drf=0;38;2;195;57;155:*.dxf=0;38;2;195;57;155:*.eip=0;38;2;195;57;155:*.elc=0;38;2;75;139;90:*.elm=0;38;2;75;139;90:*.epp=0;38;2;75;139;90:*.eps=0;38;2;195;57;155:*.erf=0;38;2;195;57;155:*.erl=0;38;2;75;139;90:*.exe=1;38;2;215;49;75:*.exr=0;38;2;195;57;155:*.exs=0;38;2;75;139;90:*.fbx=0;38;2;195;57;155:*.fff=0;38;2;195;57;155:*.fls=0;38;2;112;113;117:*.flv=0;38;2;195;57;155:*.fnt=0;38;2;195;57;155:*.fon=0;38;2;195;57;155:*.fsi=0;38;2;75;139;90:*.fsx=0;38;2;75;139;90:*.gif=0;38;2;195;57;155:*.git=0;38;2;112;113;117:*.gpr=0;38;2;195;57;155:*.gvy=0;38;2;75;139;90:*.h++=0;38;2;75;139;90:*.hda=0;38;2;195;57;155:*.hip=0;38;2;195;57;155:*.hpp=0;38;2;75;139;90:*.htc=0;38;2;75;139;90:*.htm=0;38;2;145;119;42:*.hxx=0;38;2;75;139;90:*.ico=0;38;2;195;57;155:*.ics=0;38;2;215;49;75:*.idx=0;38;2;112;113;117:*.igs=0;38;2;195;57;155:*.iiq=0;38;2;195;57;155:*.ilg=0;38;2;112;113;117:*.img=4;38;2;2;138;155:*.inc=0;38;2;75;139;90:*.ind=0;38;2;112;113;117:*.ini=0;38;2;145;119;42:*.inl=0;38;2;75;139;90:*.ino=0;38;2;75;139;90:*.ipp=0;38;2;75;139;90:*.iso=4;38;2;2;138;155:*.jar=4;38;2;2;138;155:*.jpg=0;38;2;195;57;155:*.jsx=0;38;2;75;139;90:*.jxl=0;38;2;195;57;155:*.k25=0;38;2;195;57;155:*.kdc=0;38;2;195;57;155:*.kex=0;38;2;215;49;75:*.kra=0;38;2;195;57;155:*.kts=0;38;2;75;139;90:*.log=0;38;2;112;113;117:*.ltx=0;38;2;75;139;90:*.lua=0;38;2;75;139;90:*.m3u=0;38;2;195;57;155:*.m4a=0;38;2;195;57;155:*.m4v=0;38;2;195;57;155:*.mdc=0;38;2;195;57;155:*.mef=0;38;2;195;57;155:*.mid=0;38;2;195;57;155:*.mir=0;38;2;75;139;90:*.mkv=0;38;2;195;57;155:*.mli=0;38;2;75;139;90:*.mos=0;38;2;195;57;155:*.mov=0;38;2;195;57;155:*.mp3=0;38;2;195;57;155:*.mp4=0;38;2;195;57;155:*.mpg=0;38;2;195;57;155:*.mrw=0;38;2;195;57;155:*.msi=4;38;2;2;138;155:*.mtl=0;38;2;195;57;155:*.nef=0;38;2;195;57;155:*.nim=0;38;2;75;139;90:*.nix=0;38;2;145;119;42:*.nrw=0;38;2;195;57;155:*.obj=0;38;2;195;57;155:*.obm=0;38;2;195;57;155:*.odp=0;38;2;215;49;75:*.ods=0;38;2;215;49;75:*.odt=0;38;2;215;49;75:*.ogg=0;38;2;195;57;155:*.ogv=0;38;2;195;57;155:*.orf=0;38;2;195;57;155:*.org=0;38;2;145;119;42:*.otf=0;38;2;195;57;155:*.otl=0;38;2;195;57;155:*.out=0;38;2;112;113;117:*.pas=0;38;2;75;139;90:*.pbm=0;38;2;195;57;155:*.pcx=0;38;2;195;57;155:*.pdf=0;38;2;215;49;75:*.pef=0;38;2;195;57;155:*.pgm=0;38;2;195;57;155:*.php=0;38;2;75;139;90:*.pid=0;38;2;112;113;117:*.pkg=4;38;2;2;138;155:*.png=0;38;2;195;57;155:*.pod=0;38;2;75;139;90:*.ppm=0;38;2;195;57;155:*.pps=0;38;2;215;49;75:*.ppt=0;38;2;215;49;75:*.pro=0;38;2;75;139;90:*.ps1=0;38;2;75;139;90:*.psd=0;38;2;195;57;155:*.ptx=0;38;2;195;57;155:*.pxn=0;38;2;195;57;155:*.pyc=0;38;2;112;113;117:*.pyd=0;38;2;112;113;117:*.pyo=0;38;2;112;113;117:*.qoi=0;38;2;195;57;155:*.r3d=0;38;2;195;57;155:*.raf=0;38;2;195;57;155:*.rar=4;38;2;2;138;155:*.raw=0;38;2;195;57;155:*.rpm=4;38;2;2;138;155:*.rst=0;38;2;145;119;42:*.rtf=0;38;2;215;49;75:*.rw2=0;38;2;195;57;155:*.rwl=0;38;2;195;57;155:*.rwz=0;38;2;195;57;155:*.sbt=0;38;2;75;139;90:*.sql=0;38;2;75;139;90:*.sr2=0;38;2;195;57;155:*.srf=0;38;2;195;57;155:*.srw=0;38;2;195;57;155:*.stl=0;38;2;195;57;155:*.stp=0;38;2;195;57;155:*.sty=0;38;2;112;113;117:*.svg=0;38;2;195;57;155:*.swf=0;38;2;195;57;155:*.swp=0;38;2;112;113;117:*.sxi=0;38;2;215;49;75:*.sxw=0;38;2;215;49;75:*.tar=4;38;2;2;138;155:*.tbz=4;38;2;2;138;155:*.tcl=0;38;2;75;139;90:*.tex=0;38;2;75;139;90:*.tga=0;38;2;195;57;155:*.tgz=4;38;2;2;138;155:*.tif=0;38;2;195;57;155:*.tml=0;38;2;145;119;42:*.tmp=0;38;2;112;113;117:*.toc=0;38;2;112;113;117:*.tsx=0;38;2;75;139;90:*.ttf=0;38;2;195;57;155:*.txt=0;38;2;145;119;42:*.typ=0;38;2;145;119;42:*.usd=0;38;2;195;57;155:*.vcd=4;38;2;2;138;155:*.vim=0;38;2;75;139;90:*.vob=0;38;2;195;57;155:*.vsh=0;38;2;75;139;90:*.wav=0;38;2;195;57;155:*.wma=0;38;2;195;57;155:*.wmv=0;38;2;195;57;155:*.wrl=0;38;2;195;57;155:*.x3d=0;38;2;195;57;155:*.x3f=0;38;2;195;57;155:*.xlr=0;38;2;215;49;75:*.xls=0;38;2;215;49;75:*.xml=0;38;2;145;119;42:*.xmp=0;38;2;145;119;42:*.xpm=0;38;2;195;57;155:*.xvf=0;38;2;195;57;155:*.yml=0;38;2;145;119;42:*.zig=0;38;2;75;139;90:*.zip=4;38;2;2;138;155:*.zsh=0;38;2;75;139;90:*.zst=4;38;2;2;138;155:*TODO=1:*hgrc=0;38;2;75;139;90:*.avif=0;38;2;195;57;155:*.bash=0;38;2;75;139;90:*.braw=0;38;2;195;57;155:*.conf=0;38;2;145;119;42:*.dart=0;38;2;75;139;90:*.data=0;38;2;195;57;155:*.diff=0;38;2;75;139;90:*.docx=0;38;2;215;49;75:*.epub=0;38;2;215;49;75:*.fish=0;38;2;75;139;90:*.flac=0;38;2;195;57;155:*.h264=0;38;2;195;57;155:*.hack=0;38;2;75;139;90:*.heif=0;38;2;195;57;155:*.hgrc=0;38;2;75;139;90:*.html=0;38;2;145;119;42:*.iges=0;38;2;195;57;155:*.info=0;38;2;145;119;42:*.java=0;38;2;75;139;90:*.jpeg=0;38;2;195;57;155:*.json=0;38;2;145;119;42:*.less=0;38;2;75;139;90:*.lisp=0;38;2;75;139;90:*.lock=0;38;2;112;113;117:*.make=0;38;2;75;139;90:*.mojo=0;38;2;75;139;90:*.mpeg=0;38;2;195;57;155:*.nims=0;38;2;75;139;90:*.opus=0;38;2;195;57;155:*.orig=0;38;2;112;113;117:*.pptx=0;38;2;215;49;75:*.prql=0;38;2;75;139;90:*.psd1=0;38;2;75;139;90:*.psm1=0;38;2;75;139;90:*.purs=0;38;2;75;139;90:*.raku=0;38;2;75;139;90:*.rlib=0;38;2;112;113;117:*.sass=0;38;2;75;139;90:*.scad=0;38;2;75;139;90:*.scss=0;38;2;75;139;90:*.step=0;38;2;195;57;155:*.tbz2=4;38;2;2;138;155:*.tiff=0;38;2;195;57;155:*.toml=0;38;2;145;119;42:*.usda=0;38;2;195;57;155:*.usdc=0;38;2;195;57;155:*.usdz=0;38;2;195;57;155:*.webm=0;38;2;195;57;155:*.webp=0;38;2;195;57;155:*.woff=0;38;2;195;57;155:*.xbps=4;38;2;2;138;155:*.xlsx=0;38;2;215;49;75:*.yaml=0;38;2;145;119;42:*stdin=0;38;2;112;113;117:*v.mod=0;38;2;75;139;90:*.blend=0;38;2;195;57;155:*.cabal=0;38;2;75;139;90:*.cache=0;38;2;112;113;117:*.class=0;38;2;112;113;117:*.cmake=0;38;2;75;139;90:*.ctags=0;38;2;112;113;117:*.dylib=1;38;2;215;49;75:*.dyn_o=0;38;2;112;113;117:*.gcode=0;38;2;75;139;90:*.ipynb=0;38;2;75;139;90:*.mdown=0;38;2;145;119;42:*.patch=0;38;2;75;139;90:*.rmeta=0;38;2;112;113;117:*.scala=0;38;2;75;139;90:*.shtml=0;38;2;145;119;42:*.swift=0;38;2;75;139;90:*.toast=4;38;2;2;138;155:*.woff2=0;38;2;195;57;155:*.xhtml=0;38;2;145;119;42:*Icon\r=0;38;2;112;113;117:*LEGACY=0;38;2;254;252;244;48;2;145;119;42:*NOTICE=0;38;2;254;252;244;48;2;145;119;42:*README=0;38;2;254;252;244;48;2;145;119;42:*go.mod=0;38;2;75;139;90:*go.sum=0;38;2;112;113;117:*passwd=0;38;2;145;119;42:*shadow=0;38;2;145;119;42:*stderr=0;38;2;112;113;117:*stdout=0;38;2;112;113;117:*.bashrc=0;38;2;75;139;90:*.config=0;38;2;145;119;42:*.dyn_hi=0;38;2;112;113;117:*.flake8=0;38;2;75;139;90:*.gradle=0;38;2;75;139;90:*.groovy=0;38;2;75;139;90:*.ignore=0;38;2;75;139;90:*.matlab=0;38;2;75;139;90:*.nimble=0;38;2;75;139;90:*COPYING=0;38;2;112;113;117:*INSTALL=0;38;2;254;252;244;48;2;145;119;42:*LICENCE=0;38;2;112;113;117:*LICENSE=0;38;2;112;113;117:*TODO.md=1:*VERSION=0;38;2;254;252;244;48;2;145;119;42:*.alembic=0;38;2;195;57;155:*.desktop=0;38;2;145;119;42:*.gemspec=0;38;2;75;139;90:*.mailmap=0;38;2;75;139;90:*Doxyfile=0;38;2;75;139;90:*Makefile=0;38;2;75;139;90:*TODO.txt=1:*setup.py=0;38;2;75;139;90:*.DS_Store=0;38;2;112;113;117:*.cmake.in=0;38;2;75;139;90:*.fdignore=0;38;2;75;139;90:*.kdevelop=0;38;2;75;139;90:*.markdown=0;38;2;145;119;42:*.rgignore=0;38;2;75;139;90:*.tfignore=0;38;2;75;139;90:*CHANGELOG=0;38;2;254;252;244;48;2;145;119;42:*COPYRIGHT=0;38;2;112;113;117:*README.md=0;38;2;254;252;244;48;2;145;119;42:*bun.lockb=0;38;2;112;113;117:*configure=0;38;2;75;139;90:*.gitconfig=0;38;2;75;139;90:*.gitignore=0;38;2;75;139;90:*.localized=0;38;2;112;113;117:*.scons_opt=0;38;2;112;113;117:*.timestamp=0;38;2;112;113;117:*CODEOWNERS=0;38;2;75;139;90:*Dockerfile=0;38;2;145;119;42:*INSTALL.md=0;38;2;254;252;244;48;2;145;119;42:*README.txt=0;38;2;254;252;244;48;2;145;119;42:*SConscript=0;38;2;75;139;90:*SConstruct=0;38;2;75;139;90:*.cirrus.yml=0;38;2;75;139;90:*.gitmodules=0;38;2;75;139;90:*.synctex.gz=0;38;2;112;113;117:*.travis.yml=0;38;2;75;139;90:*INSTALL.txt=0;38;2;254;252;244;48;2;145;119;42:*LICENSE-MIT=0;38;2;112;113;117:*MANIFEST.in=0;38;2;75;139;90:*Makefile.am=0;38;2;75;139;90:*Makefile.in=0;38;2;112;113;117:*.applescript=0;38;2;75;139;90:*.fdb_latexmk=0;38;2;112;113;117:*.webmanifest=0;38;2;145;119;42:*CHANGELOG.md=0;38;2;254;252;244;48;2;145;119;42:*CONTRIBUTING=0;38;2;254;252;244;48;2;145;119;42:*CONTRIBUTORS=0;38;2;254;252;244;48;2;145;119;42:*appveyor.yml=0;38;2;75;139;90:*configure.ac=0;38;2;75;139;90:*.bash_profile=0;38;2;75;139;90:*.clang-format=0;38;2;75;139;90:*.editorconfig=0;38;2;75;139;90:*CHANGELOG.txt=0;38;2;254;252;244;48;2;145;119;42:*.gitattributes=0;38;2;75;139;90:*.gitlab-ci.yml=0;38;2;75;139;90:*CMakeCache.txt=0;38;2;112;113;117:*CMakeLists.txt=0;38;2;75;139;90:*LICENSE-APACHE=0;38;2;112;113;117:*pyproject.toml=0;38;2;75;139;90:*CODE_OF_CONDUCT=0;38;2;254;252;244;48;2;145;119;42:*CONTRIBUTING.md=0;38;2;254;252;244;48;2;145;119;42:*CONTRIBUTORS.md=0;38;2;254;252;244;48;2;145;119;42:*.sconsign.dblite=0;38;2;112;113;117:*CONTRIBUTING.txt=0;38;2;254;252;244;48;2;145;119;42:*CONTRIBUTORS.txt=0;38;2;254;252;244;48;2;145;119;42:*requirements.txt=0;38;2;75;139;90:*package-lock.json=0;38;2;112;113;117:*CODE_OF_CONDUCT.md=0;38;2;254;252;244;48;2;145;119;42:*.CFUserTextEncoding=0;38;2;112;113;117:*CODE_OF_CONDUCT.txt=0;38;2;254;252;244;48;2;145;119;42:*azure-pipelines.yml=0;38;2;75;139;90"

# https://github.com/nushell/nu_scripts/blob/main/aliases/git/git-aliases.nu
# https://github.com/nushell/nu_scripts/blob/main/custom-completions/winget/winget-completions.nu
# https://github.com/nushell/nu_scripts/blob/main/custom-completions/git/git-completions.nu
# https://github.com/nushell/nu_scripts/tree/main?tab=readme-ov-file



#################################################################################
# Carapace
#################################################################################

$env.Path = ($env.Path | split row (char esep) | prepend "~/AppData/Roaming/carapace/bin")
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional


#################################################################################
# Starship
#################################################################################

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

#################################################################################
# Zoxide
#################################################################################

zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu

# https://github.com/nushell/nushell/issues/15451
let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l $in | lines | where {|x| $x != $env.PWD}
}

def "nu-complete zoxide path" [ context : string ] {
  let parts = $context | split row " " | skip 1
  {
    options : {
      sort : false
      completion_algorithm : fuzzy
      positional : false
      case_sensitive : false
    } 
    completions : ( zoxide query --list --exclude $env.PWD -- ...$parts | lines)
  }
}

def --env --wrapped z [...rest : string@"nu-complete zoxide path"] {
  __zoxide_z ...$rest
}

# Source: https://github.com/nushell/nu_scripts/blob/main/custom-menus/zoxide-menu.nu

def __zoxide_menu [] {
    {
      name: zoxide_menu
      only_buffer_difference: true
      marker: "| "
      type: {
          layout: columnar
          page_size: 20
      }
      style: {
          text: green
          selected_text: green_reverse
          description_text: yellow
      }
      source: { |buffer, position|
          zoxide query -ls $buffer
          | parse -r '(?P<description>[0-9]+) (?P<value>.+)'
      }
    }
}

def __zoxide_keybinding [] {
    {
      name: zoxide_menu
      modifier: control
      keycode: char_o
      mode: [emacs, vi_normal, vi_insert]
      event: [
        { send: menu name: zoxide_menu }
      ]
    }
}

# def __edit_keybinding [] {
#     {
#       name: edit
#       modifier: alt
#       keycode: char_e
#       mode: [emacs, vi_normal, vi_insert]
#       event: [
#         { send: OpenEditor }
#       ]
#     }
# }

export-env {
    $env.config  = ($env.config
                  | upsert menus ($env.config.menus | append (__zoxide_menu))
                  | upsert keybindings ($env.config.keybindings | append [(__zoxide_keybinding) ])
                  # | upsert keybindings ($env.config.keybindings | append [(__zoxide_keybinding) (__edit_keybinding)])
                  )
}

#################################################################################
# Yazi
#################################################################################

$env.YAZI_FILE_ONE = "C:/Program Files/Git/usr/bin/file.exe"

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}


#################################################################################
# Carapace
#################################################################################

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

#################################################################################
# Git
#################################################################################

# Source: https://github.com/nushell/nu_scripts/blob/main/aliases/git/git-aliases.nu

# returns the name of the current branch
export def git_current_branch [] {
    ^git rev-parse --abbrev-ref HEAD
}

export def git_main_branch [] {
    git remote show origin
        | lines
        | str trim
        | find --regex 'HEAD .*?[：: ].+'
        | first
        | str replace --regex 'HEAD .*?[：: ]\s*(.+)' '$1'
}

# Git Aliases
export alias ga = git add
export alias gaa = git add --all
export alias gapa = git add --patch
export alias gau = git add --update
export alias gav = git add --verbose
export alias gap = git apply
export alias gapt = git apply --3way

export alias gb = git branch
export alias gba = git branch --all
export alias gbd = git branch --delete
export alias gbD = git branch --delete --force
export alias gbl = git blame -b -w
export alias gbm = git branch --move
export alias gbmc = git branch --move (git_current_branch)
export alias gbnm = git branch --no-merged
export alias gbr = git branch --remote
export alias gbs = git bisect
export alias gbsb = git bisect bad
export alias gbsg = git bisect good
export alias gbsn = git bisect new
export alias gbso = git bisect old
export alias gbsr = git bisect reset
export alias gbss = git bisect start

export alias gc = git commit --verbose
export alias gc! = git commit --verbose --amend
export alias gcn = git commit --verbose --no-edit
export alias gcn! = git commit --verbose --no-edit --amend
export alias gca = git commit --verbose --all
export alias gca! = git commit --verbose --all --amend
export alias gcan! = git commit --verbose --all --no-edit --amend
export alias gcans! = git commit --verbose --all --signoff --no-edit --amend
export def gcam [message: string] {
    git commit --all --message $message
}
export def gcsm [message: string] {
    git commit --all --signoff $message
}
export alias gcas = git commit --all --signoff
export def gcasm [message: string] {
    git commit --all --signoff --message $message
}
export alias gcb = git checkout -b
export alias gcd = git checkout develop
export alias gcf = git config --list
export alias gcl = git clone --recurse-submodules
export alias gclean = git clean --interactive -d
export def gpristine [] {
    git reset --hard
    git clean -d --force -x
}
export alias gcm = git checkout (git_main_branch)
export def gcmsg [message: string] {
    git commit --message $message
}
export alias gco = git checkout
export alias gcor = git checkout --recurse-submodules
export alias gcount = git shortlog --summary --numbered
export alias gcp = git cherry-pick
export alias gcpa = git cherry-pick --abort
export alias gcpc = git cherry-pick --continue
export alias gcs = git commit --gpg-sign
export alias gcss = git commit --gpg-sign --signoff
export def gcssm [message: string] {
    git commit --gpg-sign --signoff --message $message
}
export alias gd = git diff
export alias gdca = git diff --cached
export alias gdcw = git diff --cached --word-diff
export alias gdct = git describe --tags (git rev-list --tags --max-count=1)
export alias gds = git diff --staged
export alias gdt = git diff-tree --no-commit-id --name-only -r
export alias gdup = git diff @{upstream}
export alias gdw = git diff --word-diff

export alias gf = git fetch
export alias gfa = git fetch --all --prune
export alias gfo = git fetch origin

export alias gg = git gui citool
export alias gga = git gui citool --amend

export alias ghh = git help

export alias gignore = git update-index --assume-unchanged

export alias gl = git log --decorate
export alias glg = git log --stat
export alias glgp = git log --stat --patch
export alias glgg = git log --graph
export alias glgga = git log --graph --decorate --all
export alias glgm = git log --graph --max-count=10
export alias glo = git log --oneline --decorate
export alias glod = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset'
export alias glods = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ad(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --date=short
export alias glog = git log --oneline --decorate --graph
export alias gloga = git log --oneline --decorate --graph --all
export alias glol = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ar(char rp) %C(char lp)bold blue(char rp)<%an>%Creset'
export alias glola = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ar(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --all
export alias glols = git log --graph $'--pretty=%Cred%h%Creset -%C(char lp)auto(char rp)%d%Creset %s %Cgreen(char lp)%ar(char rp) %C(char lp)bold blue(char rp)<%an>%Creset' --stat

export alias gm = git merge
export alias gmtl = git mergetool --no-prompt
export alias gmtlvim = git mergetool --no-prompt --tool=vimdiff
export alias gma = git merge --abort
export def gmom [] {
    let main = (git_main_branch)
    git merge $"origin/($main)"
}

export alias gp = git push
export alias gpd = git push --dry-run
export alias gpf = git push --force-with-lease
export alias gpf! = git push --force
export alias gpl = git pull
export def gpoat [] {
    git push origin --all; git push origin --tags
}
export alias gpod = git push origin --delete
export alias gpodc = git push origin --delete (git_current_branch)
def "nu-complete git pull rebase" [] {
  ["false","true","merges","interactive"]
}
export def gpr [rebase_type: string@"nu-complete git pull rebase"] {
    git pull --rebase $rebase_type
}
export alias gpu = git push upstream
export alias gpv = git push --verbose

export alias gr = git remote
export alias gpra = git pull --rebase --autostash
export alias gprav = git pull --rebase --autostash --verbose
export alias gprv = git pull --rebase --verbose
export alias gpsup = git push --set-upstream origin (git_current_branch)
export alias gra = git remote add
export alias grb = git rebase
export alias grba = git rebase --abort
export alias grbc = git rebase --continue
export alias grbd = git rebase develop
export alias grbi = git rebase --interactive
export alias grbm = git rebase (git_main_branch)
export alias grbo = git rebase --onto
export alias grbs = git rebase --skip
export alias grev = git revert
export alias grh = git reset
export alias grhh = git reset --hard
export alias groh = git reset $"origin/(git_current_branch)" --hard
export alias grm = git rm
export alias grmc = git rm --cached
export def grmv [remote: string, new_name: string] {
    git remote rename $remote $new_name
}
export def grrm [remote: string] {
    git remote remove $remote
}
export alias grs = git restore
export def grset [remote: string, url: string] {
    git remote set-url $remote $url
}
export alias grss = git restore --source
export alias grst = git restore --staged
export alias grt = cd (git rev-parse --show-toplevel or echo .)
export alias gru = git reset --
export alias grup = git remote update
export alias grv = git remote --verbose

export alias gs = git status
export alias gsb = git status --short --branch
export alias gsd = git svn dcommit
export alias gsh = git show
export alias gshs = git show -s
export alias gsi = git submodule init
export alias gsps = git show --pretty=short --show-signature
export alias gsr = git svn rebase
export alias gss = git status --short
export alias gst = git status

export alias gsta = git stash push
export alias gstaa = git stash apply
export alias gstc = git stash clear
export alias gstd = git stash drop
export alias gstl = git stash list
export alias gstp = git stash pop
export alias gsts = git stash show --text
export alias gstu = gsta --include-untracked
export alias gstall = git stash --all
export alias gsu = git submodule update
export alias gsw = git switch
export alias gswc = git switch --create

export alias gts = git tag --sign
export def gtv [] {
    git tag | lines | sort
}
export alias glum = git pull upstream (git_main_branch)

export alias gunignore = git update-index --no-assume-unchanged
export def gup [rebase_type: string@"nu-complete git pull rebase"] {
    git pull --rebase $rebase_type
}
export alias gupv = git pull --rebase --verbose
export alias gupa = git pull --rebase --autostash
export alias gupav = git pull --rebase --autostash --verbose

export alias gwch = git whatchanged -p --abbrev-commit --pretty=medium

export alias gwt = git worktree
export def gwta [path: path, branch: string] {
    git worktree add $path $branch
}
export alias gwtls = git worktree list
export alias gwtmv = git worktree move
export def gwtm [worktree: string] {
    git worktree remove $worktree
}

export alias gam = git am
export alias gamc = git am --continue
export alias gams = git am --skip
export alias gama = git am --abort
export alias gamscp = git am --show-current-patch

#################################################################################
# Completion
#################################################################################

let multiple_completer = {|spans|
  # if the current command is an alias, get it's expansion
  let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

  # overwrite
  let spans = (if $expanded_alias != null  {
    # put the first word of the expanded alias first in the span
    $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1 | str replace --regex  '\.exe$' '')
  } else {
    $spans | skip 1 | prepend ($spans.0 | str replace --regex  '\.exe$' '')
  })

  match $spans.0 {
    __zoxide_z | __zoxide_zi => $zoxide_completer
    _ => $carapace_completer 
  } | do $in $spans
}
$env.config.completions.external.completer = $multiple_completer 

#################################################################################
# Keybinds
#################################################################################

{
    name: fuzzy_dir
    modifier: control
    keycode: char_s
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline edit --append (
            ls **/*
            | where type == dir
            | get name
            | input list --fuzzy
                $'Please choose a (ansi magenta)directory(ansi reset) to (ansi cyan_underline)insert(ansi reset):'
        )"
    }
}

{
    name: fuzzy_history
    modifier: control
    keycode: char_h
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline (
            history
            | each { |it| $it.command }
            | uniq
            | reverse
            | input list --fuzzy
                $'Please choose a (ansi magenta)command from history(ansi reset):'
        )"
    }
}

#################################################################################
# ALIASES
#################################################################################

alias v = nvim
alias vh = nvim .
alias E = explorer.exe
alias e = explorer.exe .


