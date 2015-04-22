USER_DOMAIN_NAME='site'

$USER_NAME='andrewrdakers@gmail.com'

%x[sudo docker ps]

%x[mkdir embot]

%x[touch embot/site/config.js]

%x[mkdir embot/site/content]

# *insert config file with url, mail options and database=username_domain_name

%x[mkdir embot/content/images]

%x[sudo docker run -d -p 80:80 -p 443:443 --name proxy -v /var/run/docker.sock:/tmp/docker.sock -t sethbrasile/nginx-proxy-pagespeed forego start -r]

%x[sudo docker run -e PAGESPEED=1 -e VIRTUAL_HOST=site --volumes-from embotVol --name site -d -p 2368 -v ~/embot/site:/ghost-override dockerfile/ghost]

%x[sudo docker run -v /data --name embotVol stackbrew/busybox]

%x[sudo docker restart site]

%x[sudo docker restart embotVol]

%x[sudo docker restart proxy]

%x[sudo docker restart proxy]

%x[sudo docker ps]
