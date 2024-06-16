# SoMo環境構築用のDockerfile
SoMo : [リンク](https://somo.readthedocs.io/en/latest/ "SoMo: Fast, Accurate Simulations of Continuum Robots in Complex Environments")
## 環境構築方法

リポジトリをクローンして、ビルド

例
~~~bash
docker build ./ -t somo
~~~

runする際にはx11のマウントを行う

例
~~~bash
 docker run -it   --name=SoMo  -e DISPLAY=unix${DISPLAY}     -v /tmp/.X11-unix:/tmp/.X11-unix     -v $HOME/.Xauthority:/root/.Xauthority     somo
~~~
