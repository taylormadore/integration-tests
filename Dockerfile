FROM registry.access.redhat.com/ubi9/python-39@sha256:9579264b9833ae15b567c2f69c1a7b05befca3de38dd974c50a6b87eaea09ec6

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
