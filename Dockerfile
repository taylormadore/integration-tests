FROM registry.access.redhat.com/ubi9/python-39@sha256:aa925bdfc9caa49fd8ebb0c80113eab581f25f01b6c0683ac99d2919d20ba2e2

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
