# Shell script to convert cherrytree export to vimwiki notes

This script converts your text notes from cherrytree export to vimwiki notes. Node nesting turns into directory hirerachy. File index.wiki contains all links from it's directory and is found in each directory.

# Execution instructions

1. Open cherrytree 
2. Export -> Export to the plain text -> Select "All the tree"
3. Place convert.sh in the directory where all text files from your export loacted
4. Add execute permission
> chmod +x convert.sh
5. Optionally review the script, customize variables.
6. Run the script
> ./convert.sh
7. Your vimwiki directory structure loacted in folder result.

