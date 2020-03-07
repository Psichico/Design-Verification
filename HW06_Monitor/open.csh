#chmod 700 delete.csh

rm -rf .*.*.swp 
rm -rf vend/.*.*.swp
gvim -p scoreboard.sv monitor.sv reference.sv driver.sv vend/vend.sv
