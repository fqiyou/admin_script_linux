* 1. 
    - dos2unxi filename (也有unix2dos)
* 2.
    - sed 's/^M//g' filename
* 3. 
    - vi filename
    - :1,$s/^M//g
* 4.
    - cat filename | tr -d '\r' > newfilename
---

注：^M == (Ctrl+v) + (Ctrl+m)
       == (Ctrl+v) + (enter)
    look：cat -A filename


