FROM zenmldocker/zenml

COPY . /app

WORKDIR /app

RUN apt update

RUN apt install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6

RUN zenml init

RUN zenml integration install sklearn -y
RUN zenml integration install mlflow -y
RUN zenml integration install deepchecks -y

# install dependecies local_stack.sh
RUN /app/stacks/setup_local_stack.sh

RUN pip install pdfkit

CMD [ "python", "run.py", "--pipeline=end-to-end" ]