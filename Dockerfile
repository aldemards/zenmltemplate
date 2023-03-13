FROM zenmldocker/zenml

COPY . /app

WORKDIR /app

# install dependecies local_stack.sh
RUN /stack/setup_local_stack.sh

CMD [ "python", "run.py", "--pipeline='end-to-end'" ]