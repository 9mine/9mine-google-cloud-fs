FROM 9mine/9p-execfuse-jinja2:master
RUN apt-get install python -y
RUN curl https://sdk.cloud.google.com > install.sh
RUN bash install.sh --disable-prompts
ENV PATH "$PATH:/root/google-cloud-sdk/bin"
 
