// SSH WITH PORT FORWARDING FOR JUPYTER
ssh -L8889:localhost:8889 -L6006:localhost:6006 username@host

# and then opening jupyter lab without browser 
jupyter lab --no-browser --port=8889