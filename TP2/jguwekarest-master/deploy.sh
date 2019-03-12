sudo docker run --name mongodb -d mongo
sudo docker run -p 8080:8080 --link mongodb:mongodb dockerhubuser/jguweka:0AS3 &
