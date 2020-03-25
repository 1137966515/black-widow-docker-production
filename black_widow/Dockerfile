FROM alpine:3.11.3

LABEL Joshua Dagda jedagda@miners.utep.edu

RUN echo "*** Installing Bash ***" && \
    apk update && \
    apk add bash --no-cache --upgrade bash \
    bash-doc \
    bash-completion

COPY ./passwd /etc/passwd 

RUN echo "*** Installing Python3 and Pip3 ***" && \
    apk add \
    python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

COPY ./main_server /main_server

RUN echo " *** Upgrading PIP and installing virtualenv and creating a virtual environment ***" && \
    pip install --upgrade pip && \
    pip3 install virtualenv && \
    virtualenv main_server



WORKDIR /main_server/src/
RUN source /main_server/bin/activate && \
   echo "*** Setting up the Flask Application***" && \
   pip3 install flask \
   python-dotenv \
   requests \
   unique-id \
   gunicorn 

#CMD ["/bin/bash/ source /main_server/bin/activate && \ gunicorn --bind 0.0.0.0:5000 wsgi"]


 


