#!/bin/bash

# first, definiting the var
var_dir="$1"

# then, new a custome function
func_file_size(){
    find ${var_dir} -type f -size +1k|sort
}

# then, main use above functions
main(){
    func_file_size
}

main

# execute this script 
# sh dir_size.sh {your absolute path}

# modify file size
# -size +1k or +100M
