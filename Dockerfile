FROM ubuntu:20.04

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt update \
    && apt upgrade -y

RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev python-tk python3-tk tk-dev git pkg-config -y

WORKDIR /root

RUN mkdir temp

WORKDIR /root/temp

RUN wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz

RUN tar -xzvf Python-3.8.2.tgz

WORKDIR /root/temp/Python-3.8.2

RUN ./configure --with-tcltk-includes='-I/usr/include -I/usr/include/tcl' --with-tcltk-libs='-L/usr/lib -ltcl -ltk' --enable-optimizations

RUN make -j 12

RUN make install

RUN pip3 install --upgrade pip

WORKDIR /root

RUN git clone https://github.com/GrauleM/somo.git

WORKDIR /root/somo

RUN pip3 install -r requirements.txt

RUN pip3 install numpy --upgrade --ignore-installed

RUN pip install -e .

RUN sed -i "s/(np.float,/(np.float64,/g" /root/somo/somo/sm_continuum_manipulator.py
