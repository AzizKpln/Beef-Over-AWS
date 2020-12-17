from pyngrok import ngrok
import time

with open("links/port_","r") as v:
	v=v.read()
http_tunnel = ngrok.connect(int(v))
tunnels = ngrok.get_tunnels()
ngrok_link=str(tunnels[1]).split('"')

if str(ngrok_link[1]).startswith("https://"):
	write_=str(ngrok_link[1]).split("https://")
else:
	write_=str(ngrok_link[1]).split("http://")
	ngrok_process = ngrok.get_ngrok_process()
		
			
try:
	with open("../links/link.txt","w") as n:
		n.write(write_[1]) 
	with open("../links/tunnel.txt","w") as n:
		n.write(str(write_))
except:
	with open("links/link.txt","w") as n:
		n.write(write_[1]) 
	with open("links/tunnel.txt","w") as n:
		n.write(str(write_))

time.sleep(5000)
