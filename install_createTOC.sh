#!/bin/zsh -x
# change shebang to appropriate one for system - for osx Catalina its zsh
# -x shows commands & expands vars

# cd into relevant repo root directory 
# download this file:
# curl https://gist.github.com/UnacceptableBehaviour/ad168b1b86a7695e9391ff063550c340/raw/fe5c957778d1611ccda76359185ea6e29eb99a05/install_createTOC.sh > install_createTOC.sh
# chmod +x install_createTOC.sh                         # make it executable
# ./install_createTOC.sh                                # run it

# ./create_TOC_for_md.py -p       # to render README.md w/ TOC and maths equations
                                  # also adds README.md to git, commits, and pushes
                                  # -p = commit & push

# create virtual environment - if it doesn't exist [ if directory (-d) does NOT (!) exist ]
[ ! -d ./venv ] && python -m venv venv

# upgarde pip
python -m pip install --upgrade pip

# install rtf to text conversion support      
pip install striprtf

# download create_TOC_for_md.py
curl https://gist.github.com/UnacceptableBehaviour/ad168b1b86a7695e9391ff063550c340/raw/823c4978b32d62bd1546517423ade9dc5c62d578/create_TOC_for_md.py > create_TOC_for_md.py

chmod +x create_TOC_for_md.py

# download modified render.py - if you need latex
curl https://gist.github.com/UnacceptableBehaviour/ad168b1b86a7695e9391ff063550c340/raw/fe5c957778d1611ccda76359185ea6e29eb99a05/render.py > render.py

# -p make parent dirs as needed
mkdir -p ./scratch/tex          

# add scratch dir to .gitignore - temp work area - don't add if already at end of file
f='.gitignore'
if       [ "$(tail -c9 "$f")" != "$(printf 'scratch/\n')" ]
then     printf 'scratch/\n' >>"$f"
fi

# download example rtf doc
# DEFAULT_DOC_TO_PROCESS = Path('scratch/EG_README_source.rtf')
curl https://gist.github.com/UnacceptableBehaviour/ad168b1b86a7695e9391ff063550c340/raw/fe5c957778d1611ccda76359185ea6e29eb99a05/EG_README_source.rtf > scratch/EG_README_source.rtf
